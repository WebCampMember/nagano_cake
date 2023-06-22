class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path
    else
      render :new
    end
  end

  def index
  end

  def show
  end

  def edit
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price)
  end

end
