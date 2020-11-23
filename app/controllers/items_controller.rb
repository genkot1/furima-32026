class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  
  def index
    @items = Item.all
  end

  def new
    @item = Items.new
  end

  def create
    @item = Items.new(item_params)
    if @item.save
      redirect_to 
    else
      render 
    end
  end

  private

  def item_params
    params.required(:item).permit(:name, :description, :shipping_fee_id, :category_id, :price, :prefecture_id, :duration_id).merge(user_id: current_user.id)
  end
end
