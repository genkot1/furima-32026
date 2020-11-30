class OrdersController < ApplicationController
  def index
    @purchase_item = PurchaseItem.new
  end
end
