class Admin::ItemsController < Admin::BaseController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
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

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "You did it"
      redirect_to admin_items_path
    else
      flash[:notice] = "Bad job, thumbs down"
      render :edit
    end
  end

  private

  def item_params
    params[:item][:image_path] = "https://vignette2.wikia.nocookie.net/lotr/images/5/54/Untitledjk.png" if params[:item][:image_path] == ""
    params.require(:item).permit(:title, :description, :price, :image_path, :status, category_ids: [])
  end
end
