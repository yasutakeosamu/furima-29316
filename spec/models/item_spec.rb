require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
    it '商品情報があれば登録できる' do
      expect(@item).to be_valid
    end
    it '画像がないと登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Image translation missing: ja.activerecord.errors.models.item.attributes.image.blank')
    end
    it 'nameが空では登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Name translation missing: ja.activerecord.errors.models.item.attributes.name.blank')
    end
    it 'textが空では登録できない' do
      @item.text = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Text translation missing: ja.activerecord.errors.models.item.attributes.text.blank')
    end
    it 'category_idが１では登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category translation missing: ja.activerecord.errors.models.item.attributes.category_id.other_than')
    end
    it 'status_idが１では登録できない' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Status translation missing: ja.activerecord.errors.models.item.attributes.status_id.other_than')
    end
    it 'fee_idが１では登録できない' do
      @item.fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Fee translation missing: ja.activerecord.errors.models.item.attributes.fee_id.other_than')
    end
    it 'from_idが１では登録できない' do
      @item.from_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('From translation missing: ja.activerecord.errors.models.item.attributes.from_id.other_than')
    end
    it 'day_idが１では登録できない' do
      @item.day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Day translation missing: ja.activerecord.errors.models.item.attributes.day_id.other_than')
    end
    it 'priceが空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Price translation missing: ja.activerecord.errors.models.item.attributes.price.blank')
    end
    it 'priceが299円以下では登録できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price translation missing: ja.activerecord.errors.models.item.attributes.price.greater_than')
    end
    it 'priceが10,000,000円以上では登録できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price translation missing: ja.activerecord.errors.models.item.attributes.price.less_than')
    end
    it 'priceが数字以外では登録できない' do
      @item.price = '千五百円'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price translation missing: ja.activerecord.errors.models.item.attributes.price.not_a_number')
    end
  end
end
