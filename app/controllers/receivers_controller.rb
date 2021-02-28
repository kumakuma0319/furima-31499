class ReceiversController < ApplicationController
  
  def index
    @order_receiver = OrderReceiver.new
  end

  def create
    @order_receiver = OrderReceiver.new(receiver_params)
    if @order_receiver.valid?
      @order_receiver.save
      redirect_to root_path
    else
      render :index
    end
  end

private

  def receiver_params
    params.require(:order_receiver).permit(:post_code, :house_number, :prefecture_id, :building_name, :phone_number, :city).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
end
