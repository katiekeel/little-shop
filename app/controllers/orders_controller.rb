class OrdersController < ApplicationController
  before_action :find_order, only: [:show]

  def create
    @order = Order.new(user: current_user)
    create_item_orders
    @order.save
    flash[:message] = "Order was successfully placed"
    redirect_to orders_path
  end

  def index
    @orders = current_user.orders
  end

  def show

  end



  private

  def find_order
    @order = Order.find(params[:id])
  end

  def create_item_orders
    @cart.contents.each do |item, qty|
      @order.item_orders.new(item_id: item.to_i, quantity: qty)
    end
  end
end
