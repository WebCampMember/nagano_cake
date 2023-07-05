class Public::CartItemsController < ApplicationController
  def index
    @total_amount = 0
    @cart_items = CartItem.all
  end

  def create
    cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    if cart_item
      # 同じ商品の場合は追加でカウント
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.update(amount: cart_item.amount)
      redirect_to cart_items_path
    else
      # 新規商品の場合は新しく追加
      cart_item = CartItem.new(cart_item_params)
      cart_item.customer_id = current_customer.id
      cart_item.save
      redirect_to cart_items_path
    end
  end

  def update
    cart_item = CartItem.find(params[:id])
    if cart_item.update(cart_item_params)
      redirect_to cart_items_path
    else
      redirect_to cart_items_path
    end
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  private

  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end
