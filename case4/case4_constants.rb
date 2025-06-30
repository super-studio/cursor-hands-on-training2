# 定数管理ハンズオン用サンプル
# 以下のコードで直書きされた値を定数として管理するようにTabで修正体験

class UserService
  # ========= スタート =========

  def initialize
    @users = []
  end

  def create_user(name, email, age)
    if age < 18
      puts "18歳未満は登録できません"
      return false
    end
    
    if age > 120
      puts "120歳を超える年齢は無効です"
      return false
    end
    
    if email.length < 5
      puts "メールアドレスが短すぎます"
      return false
    end
    
    if email.length > 100
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
    if age >= 18 && membership_months >= 12
      puts "プレミアムユーザーです"
      return true
    end
    
    if age < 18
      puts "18歳未満はプレミアム対象外です"
      return false
    end
    
    if membership_months < 12
      puts "12ヶ月未満はプレミアム対象外です"
      return false
    end
  end
  
  def send_notification(message)
    if message.length > 500
      puts "メッセージが長すぎます（500文字以内）"
      return false
    end
    
    if message.length < 10
      puts "メッセージが短すぎます（10文字以上）"
      return false
    end
    
    puts "通知を送信しました: #{message}"
    true
  end
end