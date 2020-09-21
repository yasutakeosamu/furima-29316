require 'rails_helper'

RSpec.describe PurchaseCustomer, type: :model do
  describe 'create' do
    before do
      @purchase_customer = FactoryBot.build(:purchase_customer)
    end
    it 'カード情報と住所情報があれば登録できる' do
      expect(@purchase_customer).to be_valid
    end
    it 'カード情報のトークンが空では登録できない' do
      @purchase_customer.token = ''
      @purchase_customer.valid?
      expect(@purchase_customer.errors.full_messages).to include('Token translation missing: ja.activemodel.errors.models.purchase_customer.attributes.token.blank')
    end
    it 'postal_codeが空では登録できない' do
      @purchase_customer.postal_code = ''
      @purchase_customer.valid?
      expect(@purchase_customer.errors.full_messages).to include('Postal code translation missing: ja.activemodel.errors.models.purchase_customer.attributes.postal_code.blank')
    end
    it 'postal_codeにハイフンがないと登録できない' do
      @purchase_customer.postal_code = '0000000'
      @purchase_customer.valid?
      expect(@purchase_customer.errors.full_messages).to include('Postal code translation missing: ja.activemodel.errors.models.purchase_customer.attributes.postal_code.invalid')
    end
    it 'stateのidが1では登録できない' do
      @purchase_customer.state = 1
      @purchase_customer.valid?
      expect(@purchase_customer.errors.full_messages).to include("State can't be blank")
    end
    it 'cityが空では登録できない' do
      @purchase_customer.city = ''
      @purchase_customer.valid?
      expect(@purchase_customer.errors.full_messages).to include('City translation missing: ja.activemodel.errors.models.purchase_customer.attributes.city.blank')
    end
    it 'addressが空では登録できない' do
      @purchase_customer.address = ''
      @purchase_customer.valid?
      expect(@purchase_customer.errors.full_messages).to include('Address translation missing: ja.activemodel.errors.models.purchase_customer.attributes.address.blank')
    end
    it 'buildingは空でも登録できる' do
      @purchase_customer.building = ''
      expect(@purchase_customer).to be_valid
    end
    it 'phone_numberが空では登録できない' do
      @purchase_customer.phone_number = ''
      @purchase_customer.valid?
      expect(@purchase_customer.errors.full_messages).to include('Phone number translation missing: ja.activemodel.errors.models.purchase_customer.attributes.phone_number.blank')
    end
    it 'phone_numberにハイフンがあると登録できない' do
      @purchase_customer.phone_number = '090-1234-5678'
      @purchase_customer.valid?
      expect(@purchase_customer.errors.full_messages).to include('Phone number translation missing: ja.activemodel.errors.models.purchase_customer.attributes.phone_number.invalid')
    end
  end
end
