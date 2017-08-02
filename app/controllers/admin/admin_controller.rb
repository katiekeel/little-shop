class Admin::AdminController < Admin::BaseController

  def index
    @orders = Order.all
  end
end
