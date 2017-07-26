class CategoriesController < ApplicationController
  
  def show
    @category = Category.find_by(title: params[:category_title])
    @items = @category.items
  end


end
