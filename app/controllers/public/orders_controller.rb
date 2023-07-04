class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    select_address = params[:order][:select_address]
    if select_address == "0"
      # ログインユーザーの住所
      @order = Order.new(order_params)
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.address_name = current_customer.last_name + current_customer.first_name
    elsif select_address == "1"
      # 登録済み住所
      @order = Order.new(order_params)
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.address_name = @address.address_name
    elsif select_address == "2"
      # 新しい住所
      @order = Order.new(order_params)
    else
      render :new
    end
  end

  def create

  end

  def thanx

  end

  def index

  end

  def show

  end

  private

  def order_params
    params.require(:order).permit(:pay_method, :postal_code, :address, :address_name)
  end
end
