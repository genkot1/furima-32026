class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy, :move_to_index]
  
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to action: :index
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.required(:item).permit(:image, :name, :description, :shipping_fee_id, :category_id, :condition_id, :price, :prefecture_id, :duration_id).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in? && current_user.id == @item.user.id
      redirect_to action: :index
    end
  end
end
