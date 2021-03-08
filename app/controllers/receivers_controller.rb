class ReceiversController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :item_for_params, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @order_receiver = OrderReceiver.new
  end

  def create
    @order_receiver = OrderReceiver.new(receiver_params)
    if @order_receiver.valid?
      pay_item
      @order_receiver.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def receiver_params
    params.require(:order_receiver).permit(:post_code, :house_number, :prefecture_id, :building_name, :phone_number, :city).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: receiver_params[:token],
      currency: 'jpy'
    )
  end

  def item_for_params
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
  end
end
