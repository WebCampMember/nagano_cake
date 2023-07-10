class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)
    else
      render :new
    end
  end

  def index
    @items = Item.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
    @genre = Genre.find(@item.genre_id)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      # flash[:success] = "You have updated book successfully."
      redirect_to admin_item_path(@item)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price, :genre_id)
  end

end
