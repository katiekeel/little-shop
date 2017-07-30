class OrdersController < ApplicationController
  before_action :find_order, only: [:show]

  def create
    @order = Order.new(user: current_user)
    @cart.contents.each do |item, qty|
      @order.item_orders.new(item_id: item.to_i, quantity: qty)
    end
    @order.save
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
end
