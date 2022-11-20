class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX, message: "半角英数字を混合してね"}

         with_options presence: true do
          validates :nickname
          validates :first_name
          validates :family_name
          validates :first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/, message: "カタカナで入力してね"}
          validates :family_name_kana, format: {with: /\A[ァ-ヶー－]+\z/, message: "カタカナで入力してね"}
          validates :birth_day
         end



         
  
  
end
