import 'dotenv/config';
import { McpServer } from '@modelcontextprotocol/sdk/server/mcp.js';
import { StdioServerTransport } from '@modelcontextprotocol/sdk/server/stdio.js';
import { WebClient } from '@slack/web-api';
import { z } from 'zod';

const mcp = new McpServer({ name: 'slack-mcp', version: '1.0.0' });

function getClient() {
  const token = process.env.SLACK_BOT_TOKEN || process.env.SLACK_USER_TOKEN;
  if (!token) {
    throw new Error('Missing SLACK_BOT_TOKEN or SLACK_USER_TOKEN');
  }
  return new WebClient(token);
}

mcp.registerTool(
  'slack.listConversations',
  {
    description: 'List Slack conversations (channels, groups, ims)',
    inputSchema: {
      types: z
        .array(z.enum(['public_channel', 'private_channel', 'mpim', 'im']))
        .default(['public_channel', 'private_channel'])
        .describe('Conversation types'),
      limit: z.number().int().min(1).max(1000).default(200),
      exclude_archived: z.boolean().default(true)
    }
  },
  async ({ types, limit, exclude_archived }) => {
    const client = getClient();
    const conversations = [];
    let cursor;
    do {
      const res = await client.conversations.list({
        types: types.join(','),
        exclude_archived,
        cursor,
        limit: Math.min(limit, 200)
      });
      conversations.push(...(res.channels ?? []));
      cursor = res.response_metadata?.next_cursor;
      if (conversations.length >= limit) break;
    } while (cursor);
    return {
      content: [
        {
          type: 'json',
          json: conversations.slice(0, limit)
        }
      ]
    };
  }
);

mcp.registerTool(
  'slack.history',
  {
    description: 'Fetch channel history by channel ID',
    inputSchema: {
      channel: z.string().min(1).describe('Channel ID like Cxxxx'),
      limit: z.number().int().min(1).max(5000).default(500),
      oldest: z.string().optional().describe('Unix timestamp as string'),
      latest: z.string().optional().describe('Unix timestamp as string'),
      inclusive: z.boolean().default(false),
      with_replies: z.boolean().default(false)
    }
  },
  async ({ channel, limit, oldest, latest, inclusive, with_replies }) => {
    const client = getClient();
    const messages = [];
    let cursor;
    do {
      const res = await client.conversations.history({
        channel,
        oldest,
        latest,
        inclusive,
        cursor,
        limit: Math.min(200, limit - messages.length)
      });
      const page = res.messages ?? [];
      messages.push(...page);
      cursor = res.response_metadata?.next_cursor;
      if (messages.length >= limit || !cursor) break;
    } while (cursor);

    if (with_replies) {
      const threadRoots = messages.filter(m => m.thread_ts && m.thread_ts === m.ts);
      for (const root of threadRoots) {
        const replies = [];
        let rc;
        do {
          const rr = await client.conversations.replies({
            channel,
            ts: root.ts,
            cursor: rc,
            limit: 200
          });
          replies.push(...(rr.messages ?? []));
          rc = rr.response_metadata?.next_cursor;
        } while (rc);
        root.replies = replies;
      }
    }

    return {
      content: [
        {
          type: 'json',
          json: messages.slice(0, limit)
        }
      ]
    };
  }
);

async function main() {
  const transport = new StdioServerTransport();
  await mcp.connect(transport);
  // eslint-disable-next-line no-console
  console.log('Slack MCP running on stdio');
}

main().catch(err => {
  // eslint-disable-next-line no-console
  console.error(err);
  process.exit(1);
});
