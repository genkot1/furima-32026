class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  VALID_KANJI_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/
  VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/

  validates :nickname, presence: true
  validates :password, format: { with: VALID_PASSWORD_REGEX, message:"includes both letters and numbers" }
  validates :kanji_last_name, presence: true, format: { with: VALID_KANJI_REGEX, message:"full-width characters" }
  validates :kanji_first_name, presence: true, format: { with: VALID_KANJI_REGEX, message:"full-width characters" }
  validates :kana_last_name, presence: true, format: { with: VALID_KANA_REGEX, message:"full-width katakana characters" }
  validates :kana_first_name, presence: true, format: { with: VALID_KANA_REGEX, message:"full-width katakana characters" }
  validates :birthday, presence: true
end
