class OrdersController < ApplicationController
  before_action :find_order, only: [:show]

  def index
    @orders = current_user.orders
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
end
