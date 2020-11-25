class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  
  def index
    @items = Item.all.order("created_at DESC")
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

  private

  def item_params
    params.required(:item).permit(:image, :name, :description, :shipping_fee_id, :category_id, :condition_id, :price, :prefecture_id, :duration_id).merge(user_id: current_user.id)
  end
end
