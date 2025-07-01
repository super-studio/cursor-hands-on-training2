# 定数管理ハンズオン用サンプル
# 以下のコードで直書きされた値を定数として管理するようにTabで修正体験

class UserService
  # ========= スタート =========

  MIN_AGE = 18
  MAX_AGE = 120
  MIN_EMAIL_LENGTH = 5
  MAX_EMAIL_LENGTH = 100
  MIN_MEMBERSHIP_MONTHS = 12
  MAX_MESSAGE_LENGTH = 500

  def initialize
    @users = []
  end

  def create_user(name, email, age)
    if age < MIN_AGE
      puts "18歳未満は登録できません"
      return false
    end
    
    if age > MAX_AGE
      puts "120歳を超える年齢は無効です"
      return false
    end
    
    if email.length < MIN_EMAIL_LENGTH
      puts "メールアドレスが短すぎます"
      return false
    end
    
    if email.length > MAX_EMAIL_LENGTH
      puts "メールアドレスが長すぎます"
      return false
    end
    
    user = {
      name: name,
      email: email,
      age: age,
      status: "active"
    }
    
    @users << user
    puts "ユーザーを作成しました"
    true
  end
  
  def validate_premium_user(age, membership_months)
    if age >= MIN_AGE && membership_months >= MIN_MEMBERSHIP_MONTHS
      puts "プレミアムユーザーです"
      return true
    end
    
    if age < MIN_AGE
      puts "18歳未満はプレミアム対象外です"
      return false
    end
    
    if membership_months < MIN_MEMBERSHIP_MONTHS
      puts "12ヶ月未満はプレミアム対象外です"
      return false
    end
  end
  
  def send_notification(message)
    if message.length > MAX_MESSAGE_LENGTH
      puts "メッセージが長すぎます（500文字以内）"
      return false
    end
    
    if message.length < MIN_MESSAGE_LENGTH
      puts "メッセージが短すぎます（10文字以上）"
      return false
    end
    
    puts "通知を送信しました: #{message}"
    true
  end
end