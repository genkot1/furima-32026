require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "nicknameが空では登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it "passwordに英字と数字が両方含まれなければ登録できない" do
      @user.password = "aaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password includes both letters and numbers"
    end
    it "passwordとpassword_confirmationが異なると登録できない" do
      @user.password = "abc1234"
      @user.password_confirmation = "abc123"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it "kanji_last_nameが空では登録できない" do
      @user.kanji_last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Kanji last name can't be blank"
    end
    it "kanji_last_nameが半角文字では登録できない" do
      @user.kanji_last_name = "abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include "Kanji last name full-width characters"
    end
    it "kanji_first_nameが空では登録できない" do
      @user.kanji_first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Kanji first name can't be blank"
    end
    it "kanji_first_nameが半角文字では登録できない" do
      @user.kanji_first_name = "abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include "Kanji first name full-width characters"
    end
    it "kana_last_nameが空では登録できない" do
      @user.kana_last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Kana last name can't be blank"
    end
    it "kana_last_nameが全角カナ以外では登録できない" do
      @user.kana_first_name = "漢字かな"
      @user.valid?
      expect(@user.errors.full_messages).to include "Kana first name full-width katakana characters"
    end
    it "kana_first_nameが空では登録できない" do
      @user.kana_first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Kana first name can't be blank"
    end
    it "kana_first_nameが全角カナ以外では登録できない" do
      @user.kana_first_name = "漢字かな"
      @user.valid?
      expect(@user.errors.full_messages).to include "Kana first name full-width katakana characters"
    end
    it "birthdayが空では登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
  end
end
