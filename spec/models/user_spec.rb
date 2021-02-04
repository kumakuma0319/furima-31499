require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)

    end

    it "nickname、email、passwordとpassword_confirmation、first_name、last_name、first_name_kana、last_name_kana、birthがあれば登録できる" do
      expect(@user).to be_valid
    end
    it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "first_nameが空では登録できない" do
    end
    it "last_nameが空では登録できない" do
    end
    it "first_name_kanaが空では登録できない" do
    end
    it "last_name_kanaが空では登録できない" do
    end   
    it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "重複したemailがあっては登録できない" do
      @user.email = ''
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空では登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordとpassword_confirmationが６文字以上であれば登録できる" do
      @user.password = 'aaaaa1'
      @user.password_confirmation = 'aaaaa1'
      expect(@user).to be_valid
    end
    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordが５文字以下では登録できない" do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it "passwordは英字と数字の両方が含まれていないと登録できない" do
      @user.password = 'aaaaa1'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "birthが空では登録できない" do
      @user.birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
    end
  end
end