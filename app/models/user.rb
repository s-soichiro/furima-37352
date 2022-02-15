class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :birth_date, presence: true

  with_options presence: true do
    validates :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は全角で入力してください"}
    validates :last_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は全角で入力してください"}
    validates :first_name_kana, format: {with: /\A[ァ-ヶー]+\z/, message: "は全角カナで入力してください"}
    validates :last_name_kana, format: {with: /\A[ァ-ヶー]+\z/, message: "は全角カナで入力してください"}
  end

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: "は半角英数字を入力してください"}

end
