class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @cart_items = current_customer.cart_items.all #カート内アイテムの表示用変数

    total = 0 #合計金額用の変数
    @cart_items.each do |cart_items|
      total += cart_items.subtotal
    end

    @total_amount = total #合計金額用の変数
    @postage = 800 #送料800円の変数
    @pay_money = @total_amount + @postage #支払金額用の変数
    select_address = params[:order][:select_address] #ラジオボタン選択番号を検索
    if select_address == "0"
      # (「0」番の場合)ログインユーザーの住所
      @order = Order.new(order_params)
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.address_name = current_customer.last_name + current_customer.first_name
    elsif select_address == "1"
      # (「1」番の場合)登録済み住所
      @order = Order.new(order_params)
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.address_name = @address.address_name
    elsif select_address == "2"
      # (「2」番の場合)新しい住所
      @order = Order.new(order_params)
    else
      render :new
    end
  end

  def create
    order = Order.new(order_params)
    order.customer_id = current_customer.id
    order.postage = params[:order][:postage].to_i
    order.pay_money= params[:order][:pay_money].to_i
    order.save

    @order_detail = OrderDetail.new(order_detail_params)
    @order = Order.find(params[:order_detail][:order_id])
    @order_detail.order_id = @order.id
    # kokokarasaikai
    redirect_to thanx_orders_path
  end

  def thanx
  end

  def index

  end

  def show

  end

  private

  def order_params
    params.require(:order).permit(:pay_method, :postal_code, :address, :address_name, :postage, :pay_money)
  end

  def order_detail_params
    params.require(:order_detail).permit(:order_id, :item_id, :price, :amount)
  end
end
