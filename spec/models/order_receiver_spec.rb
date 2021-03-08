require 'rails_helper'

RSpec.describe OrderReceiver, type: :model do
  describe '#create' do
    before do
      @order_receiver = FactoryBot.build(:order_receiver)
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_receiver.user_id = @user.id
      @order_receiver.item_id = @item.id
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it '全ての値があれば登録できること' do
        expect(@order_receiver).to be_valid
      end

      it 'building_nameがなくても登録できること' do
        @order_receiver.building_name = ''
        expect(@order_receiver).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeがなければ登録できないこと' do
        @order_receiver.post_code = ''
        @order_receiver.valid?
        expect(@order_receiver.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeにはハイフンが必要であること' do
        @order_receiver.post_code = '11111111'
        @order_receiver.valid?
        expect(@order_receiver.errors.full_messages).to include('Post code はハイフンをつけて入力してください')
      end

      it 'cityがなければ登録できないこと' do
        @order_receiver.city = ''
        @order_receiver.valid?
        expect(@order_receiver.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberがなければ登録できないこと' do
        @order_receiver.house_number = ''
        @order_receiver.valid?
        expect(@order_receiver.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberがなければ登録できないこと' do
        @order_receiver.phone_number = ''
        @order_receiver.valid?
        expect(@order_receiver.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberにハイフンは不要であること' do
        @order_receiver.phone_number = '123-4567-8901'
        @order_receiver.valid?
        expect(@order_receiver.errors.full_messages).to include('Phone number はハイフンなし、 かつ１２桁以上では登録できません')
      end

      it 'phone_numberは１２桁以上では登録できないこと' do
        @order_receiver.phone_number = '1234567890123'
        @order_receiver.valid?
        expect(@order_receiver.errors.full_messages).to include('Phone number はハイフンなし、 かつ１２桁以上では登録できません')
      end

      it 'prefecture_idがなければ登録できないこと' do
        @order_receiver.prefecture_id = 1
        @order_receiver.valid?
        expect(@order_receiver.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it 'tokenが空では登録できないこと' do
        @order_receiver.token = ''
        @order_receiver.valid?
        expect(@order_receiver.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが空では登録できないこと' do
        @order_receiver.user_id = ''
        @order_receiver.valid?
        expect(@order_receiver.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では登録できないこと' do
        @order_receiver.item_id = ''
        @order_receiver.valid?
        expect(@order_receiver.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
