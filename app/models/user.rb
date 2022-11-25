class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with:  VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります'
         

         with_options presence: true do
          validates :nickname
          validates :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
          validates :family_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
          validates :first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/, message: "カタカナで入力してね"}
          validates :family_name_kana, format: {with: /\A[ァ-ヶー－]+\z/, message: "カタカナで入力してね"}
          validates :birth_day
         end



         
  
  
end
