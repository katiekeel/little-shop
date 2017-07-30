class CategoriesController < ApplicationController

  def show
    @category = Category.find_by(title: params["category_title"].split.map(&:capitalize)*' ')
    @items = @category.items
  end
end
