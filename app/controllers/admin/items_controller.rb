class Admin::ItemsController < Admin::BaseController
  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    if item.save
      flash[:notice] = "Item Created"
      redirect_to admin_items_path
    else
      flash[:notice] = "Item not created. Please try again."
      render :new
    end
  end

  def index
    @items = Item.all
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :image_path, category_ids: [])
  end
end
