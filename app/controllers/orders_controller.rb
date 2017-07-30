class OrdersController < ApplicationController
  before_action :find_order, only: [:show]

  def create
    byebug

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
