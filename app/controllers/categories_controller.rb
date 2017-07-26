class CategoriesController < ApplicationController

  def about

  end
  
  def show
    @category = Category.find_by(title: params[:category_title])
    @items = @category.items
  end


end
