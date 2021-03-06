require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '全ての項目が存在すれば登録できること' do
      expect(@item).to be_valid
    end

    it 'nameがなければ登録できないこと' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'itoroductionが空では登録できないこと' do
      @item.introduction = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Introduction can't be blank")
    end

    it 'categoryが空では登録できないこと' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Category is not a number')
    end

    it 'categoryの1を選択すると登録できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end

    it 'conditionが空では登録できないこと' do
      @item.condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition is not a number')
    end

    it 'conditionの1を選択すると登録できないこと' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition must be other than 1')
    end

    it 'postage_payerがなければ登録できないこと' do
      @item.postage_payer_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Postage payer is not a number')
    end

    it 'postage_payerの1を選択すると登録できないこと' do
      @item.postage_payer_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Postage payer must be other than 1')
    end

    it 'prefectureがなければ登録できないこと' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture is not a number')
    end

    it 'prefectureの1を選択すると登録できないこと' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
    end

    it 'preparation_dayがなければ登録できないこと' do
      @item.preparation_day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Preparation day is not a number')
    end

    it 'preparation_dayの1を選択すると登録できないこと' do
      @item.preparation_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Preparation day must be other than 1')
    end

    it 'priceがなければ登録できないこと' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is not a number')
    end

    it 'priceが、¥299以下だと登録できないこと' do
      @item.price = 100
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end

    it 'priceが、¥10,000,000以上だと登録できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end

    it 'priceは半角数字でなければ登録できないこと' do
      @item.price = 'aaaaaa'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end

    it 'priceは全角文字では登録できないこと' do
      @item.price = '１１１１１１'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end

    it 'priceは英数字混合では登録できないこと' do
      @item.price = 'aaa111'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
  end
end
