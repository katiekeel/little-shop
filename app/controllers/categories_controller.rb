class CategoriesController < ApplicationController

  def show
    @category = Category.find_by(title: params["category_title"].split.map(&:capitalize)*' ')
    if @category.nil?
      render file: "/public/404"
    else
      @items = @category.items
    end
  end
end
