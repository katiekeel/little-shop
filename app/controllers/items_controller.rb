class ItemsController < ApplicationController
  before_action :find_item, only: [:show]

  def index
    @items = Item.all
  end

  def show
  end

  private

  def find_item
    @item = Item.find(params[:id])
  end
end
