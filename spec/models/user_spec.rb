require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    it 'ユーザー情報、本人確認情報があれば登録できる' do
      expect(@user).to be_valid
    end
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Nickname translation missing: ja.activerecord.errors.models.user.attributes.nickname.blank')
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Email translation missing: ja.activerecord.errors.models.user.attributes.email.blank')
    end
    it '重複するemailは登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email translation missing: ja.activerecord.errors.models.user.attributes.email.taken')
    end
    it 'emailに@が含まれないと登録できない' do
      @user.email = 'test.mail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email translation missing: ja.activerecord.errors.models.user.attributes.email.invalid')
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Password translation missing: ja.activerecord.errors.models.user.attributes.password.blank')
    end
    it 'password_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Password confirmation translation missing: ja.activerecord.errors.models.user.attributes.password_confirmation.confirmation')
    end
    it 'passwordがアルファベットだけでは登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password translation missing: ja.activerecord.errors.models.user.attributes.password.invalid')
    end
    it 'passwordが数字だけでは登録できない' do
      @user.password = '000000'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password translation missing: ja.activerecord.errors.models.user.attributes.password.invalid')
    end
    it 'familynameが空では登録できない' do
      @user.familyname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Familyname translation missing: ja.activerecord.errors.models.user.attributes.familyname.blank')
    end
    it 'firstnameが空では登録できない' do
      @user.firstname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Firstname translation missing: ja.activerecord.errors.models.user.attributes.firstname.blank')
    end
    it 'familynameが全角でないと登録できない' do
      @user.familyname = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Familyname translation missing: ja.activerecord.errors.models.user.attributes.familyname.invalid')
    end
    it 'firstnameが全角でないと登録できいない' do
      @user.firstname = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Firstname translation missing: ja.activerecord.errors.models.user.attributes.firstname.invalid')
    end
    it 'familyname_readerが空では登録できない' do
      @user.familyname_reader = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Familyname reader translation missing: ja.activerecord.errors.models.user.attributes.familyname_reader.blank')
    end
    it 'firstname_readerが空では登録できない' do
      @user.firstname_reader = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Firstname reader translation missing: ja.activerecord.errors.models.user.attributes.firstname_reader.blank')
    end
    it 'familyname_readerがカタカナでないと登録できない' do
      @user.familyname_reader = 'ひらがな'
      @user.valid?
      expect(@user.errors.full_messages).to include('Familyname reader translation missing: ja.activerecord.errors.models.user.attributes.familyname_reader.invalid')
    end
    it 'firstname_readerがカタカナでないと登録できない' do
      @user.firstname_reader = 'ひらがな'
      @user.valid?
      expect(@user.errors.full_messages).to include('Firstname reader translation missing: ja.activerecord.errors.models.user.attributes.firstname_reader.invalid')
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Birthday translation missing: ja.activerecord.errors.models.user.attributes.birthday.blank')
    end
  end
end
