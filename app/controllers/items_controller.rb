class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

 def edit
 end
 
 def update
 end

  private
  def item_params
    params.require(:item).permit(:name, :category_id, :prefecture_id, :postage_payer_id, :preparation_day_id, :condition_id, :price, :introduction, :image).merge(user_id: current_user.id)
  end
end

