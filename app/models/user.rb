class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/
  VALID_KANJI_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/
  VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/

  with_options presence: true do
    validates :nickname
    validates :kanji_last_name, format: { with: VALID_KANJI_REGEX, message:"full-width characters" }
    validates :kanji_first_name, format: { with: VALID_KANJI_REGEX, message:"full-width characters" }
    validates :kana_last_name, format: { with: VALID_KANA_REGEX, message:"full-width katakana characters" }
    validates :kana_first_name, format: { with: VALID_KANA_REGEX, message:"full-width katakana characters" }
    validates :birthday
  end
  
  validates :password, format: { with: VALID_PASSWORD_REGEX, message:"includes both letters and numbers" }
end
