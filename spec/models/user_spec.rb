require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー新規登録" do
    context "ユーザー登録ができる" do
      it "nickname,email,password,password_confirmation,last_name,first_name,last_name_reading,first_name_reading,birthdayが正しく入力されている" do
        expect(@user).to be_valid
      end
    end


    context "ユーザー登録ができない" do
      it "nicknameが空" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "passwordが空" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "last_nameが空" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it "first_nameが空" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "last_name_readingが空" do
        @user.last_name_reading = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading can't be blank")
      end

      it "first_name_readingが空" do
        @user.first_name_reading = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading can't be blank")
      end

      it "birthdayが空" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it "emailに一意性がない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      
      it "emailに@がない" do
        @user.email = "aaa111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      
      it "passwordとpassword_confirmationが不一致" do
        @user.password = "aaa111"
        @user.password_confirmation = "aaa222"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "passwordが5桁以下" do
        @user.password = "aaa11"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordが129桁以上" do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
      end

      it "passwordが半角英字を含んでいない" do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end

      it "passwordが半角数字を含んでいない" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end

      it "passwordが全角を含んでいる" do
        @user.password = "AAAAAAA"
        @user.valid?
        binding.pry
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end

      it "last_nameが全角ひらがな、カタカナ、漢字以外" do
        @user.last_name = "taro"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters")
      end

      it "first_nameが全角ひらがな、カタカナ、漢字以外" do
        @user.first_name = "yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters")
      end

      it "last_name_readingが全角カタカナ以外" do
        @user.last_name_reading = "太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading is invalid. Input full-width katakana characters")
      end

      it "first_name_readingが全角カタカナ以外" do
        @user.first_name_reading = "山田"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading is invalid. Input full-width katakana characters")
      end
    end
  end
end
