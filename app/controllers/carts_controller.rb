class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def index
    @items = Item.find(@cart.contents.keys)
  end

  def create
    item = Item.find(params[:item_id])

    @cart.add_item(item.id)
    session[:cart] = @cart.contents

    flash[:notice] = "You now have #{pluralize(session[:cart][item.id.to_s], item.title)}."
    redirect_to items_path
  end

  def destroy
    item = Item.find(params[:item_id])
    @cart.delete_item(item.id)
    session[:cart] = @cart.contents

    flash[:notice] = "You have successfully removed #{item.title} from the cart."
    redirect_to cart_path
  end

end
