class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper
  before_action :find_item, only: [:create, :destroy, :update]

  def index
    @items = Item.find(@cart.contents.keys)
  end

  def create
    @cart.add_item(@item.id)
    session[:cart] = @cart.contents
    flash[:notice] = "You now have #{pluralize(session[:cart][@item.id.to_s], @item.title)}."
    redirect_back(fallback_location: items_path)
  end

  def destroy
    delete_from_cart
    session[:cart] = @cart.contents
    flash[:notice] = "You have successfully removed <a href='/items/#{@item.id}'>#{@item.title}</a> from the cart."
    redirect_to cart_path
  end

  def update
    if params[:quantity] == "0"
      delete_from_cart
    else
      @cart.update_item(@item.id, params[:quantity])
    end
    session[:cart] = @cart.contents
    flash[:notice] = "You now have #{pluralize(session[:cart][@item.id.to_s], @item.title)}."
    redirect_back(fallback_location: items_path)
  end

  private

  def find_item
    @item = Item.find(params[:item_id])
  end

  def delete_from_cart
    @cart.delete_item(@item.id)
  end
end
