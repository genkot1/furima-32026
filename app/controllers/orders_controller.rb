class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index_for_seller, only: [:index, :create]
  before_action :move_to_index_after_purchased, only: [:index, :create]

  def index
    @purchase_item = PurchaseItem.new
  end

  def create
    @purchase_item = PurchaseItem.new(order_params)
    if @purchase_item.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
      @purchase_item.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:purchase_item).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index_for_seller
    if @item.user.id == current_user.id
      redirect_to root_path
    end
  end

  def move_to_index_after_purchased
    if Order.where("item_id = #{@item.id}").present?
      redirect_to root_path
    end
  end
end
