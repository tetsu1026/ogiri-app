require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "新規登録" do
    context "登録できる時" do
      it "プロフィール写真以外の情報が入力されていれば登録できる" do
        expect(@user).to be_valid
      end

      it "プロフィール写真がなくても登録できる" do
        @user.image = nil
        expect(@user).to be_valid
      end
    end
    context "登録できない時" do
      it "emailが空だと登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailには＠がないと登録できない" do
        @user.email = "testtest"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "同じemailは登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordの入力がないと登録できない" do
        @user.password = nil
        @user.password_confirmation = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "パスワードは、確認用を含めて2回入力しないと登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "パスワードは英数混合でなくては登録できない" do
        @user.password = "111111"
        @user.password_confirmation = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には半角の英字数字の両方を含めて設定してください")
      end
      it "パスワードは英語だけでは登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には半角の英字数字の両方を含めて設定してください")
      end
      it "パスワードは6文字以下では登録できない" do
        @user.password = "aaa11"
        @user.password_confirmation = "aaa11"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "パスワードは全角では登録できない" do
        @user.password = "aaa１１１１"
        @user.password_confirmation = "aaa１１１１"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には半角の英字数字の両方を含めて設定してください")
      end
      it "パスワードは、2つ一致してないと登録できない" do
        @user.password_confirmation = "bbb111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "nicknameがないと登録できない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "profileがないと登録できない" do
        @user.profile = ""
        @user.valid?
        binding.pry
        expect(@user.errors.full_messages).to include("Profile can't be blank")
      end
    end
  end
end
