require 'rails_helper'

RSpec.describe OrderReceiver, type: :model do
  describe '#create' do
    before do
      @order_receiver = FactoryBot.build(:order_receiver)
    end

    it "建物名以外の全ての値があれば登録できること" do
      expect(@order_receiver).to be_valid
    end

    it "post_codeがなければ登録できないこと" do
      @order_receiver.post_code = ''
      @order_receiver.valid?
      expect(@order_receiver.errors.full_messages).to include("Post code can't be blank", "Post code はハイフンをつけて入力してください")
    end

    it "郵便番号にはハイフンが必要であること" do
      @order_receiver.post_code = '1111111'
      @order_receiver.valid?
      expect(@order_receiver.errors.full_messages).to include("Post code はハイフンをつけて入力してください")
    end

    it "cityがなければ登録できないこと" do
      @order_receiver.city = ''
      @order_receiver.valid?
      expect(@order_receiver.errors.full_messages).to include("City can't be blank")
    end

    it "建物名がなくても登録できること" do
      @order_receiver.building_name = ''
      expect(@order_receiver).to be_valid
    end

    it "house_numberがなければ登録できないこと" do
      @order_receiver.house_number = ''
      @order_receiver.valid?
      expect(@order_receiver.errors.full_messages).to include("House number can't be blank")
    end

    it "phone_numberがなければ登録できないこと" do
      @order_receiver.phone_number = ''
      @order_receiver.valid?
      expect(@order_receiver.errors.full_messages).to include("Phone number can't be blank", "Phone number はハイフンなしで入力してください")
    end

    it "phone_numberにハイフンは不要であること" do
      @order_receiver.phone_number = '123-4567-8901'
      @order_receiver.valid?
      expect(@order_receiver.errors.full_messages).to include("Phone number はハイフンなしで入力してください")
    end

    it "prefecture_idがなければ登録できないこと" do
      @order_receiver.prefecture_id = '1'
      @order_receiver.valid?
      expect(@order_receiver.errors.full_messages).to include("Prefecture must be other than 1")
    end

  end
end
