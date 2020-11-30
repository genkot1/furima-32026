class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @order = Order.new
    @purchase_item = PurchaseItem.new
  end

  def create
    @purchase_item = PurchaseItem.new(order_params)
    if @purchase_item.valid?
      @purchase_item.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:purchase_item).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
