require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "各項目が入力されていればユーザー登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上の英数混在で登録できる" do
        @user.password = "abc123"
        @user.password_confirmation = "abc123"
        expect(@user).to be_valid
      end
      it "kanji_last_nameが全角漢字ひらがなカタカナで登録できる" do
        @user.kanji_last_name = "漢字かなカナ"
        expect(@user).to be_valid
      end
      it "kanji_first_nameが全角漢字ひらがなカタカナで登録できる" do
        @user.kanji_first_name = "漢字かなカナ"
        expect(@user).to be_valid
      end
      it "kana_last_nameが全角カタカナで登録できる" do
        @user.kana_last_name = "カナ"
        expect(@user).to be_valid
      end
      it "kana_first_nameが全角カタカナで登録できる" do
        @user.kana_first_name = "カタカナ"
        expect(@user).to be_valid
      end
    end
    
    context '新規登録がうまくいかないとき' do
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
      it "passwordが5文字以下では登録できない" do
        @user.password = "abc12"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
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
end
