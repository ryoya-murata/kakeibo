class User < ApplicationRecord
    # パスワードを安全に保存するための記述
    has_secure_password
    
    # バリデーション
    validates :name, presence: true, length: {maximum: 20}
    validates :email, presence: true, uniqueness: true, length: {maximum: 50}
end
