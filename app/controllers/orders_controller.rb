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
    @orders = current_user.orders if current_user
    if @orders.nil?
      flash[:notice] = "Please log in to your account to view your order details."
      redirect_to login_path
    end
  end

  def show

  end



  private

  def find_order
    @order = current_user.orders.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:notice] = "Please login appropriately to view that order."
      redirect_to login_path
  end

  def create_item_orders
    @cart.contents.each do |item, qty|
      @order.item_orders.new(item_id: item.to_i, quantity: qty)
    end
  end
end
