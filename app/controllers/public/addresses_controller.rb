class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.all
  end

  def create
    address = Address.new(address_params)
    address.customer_id = current_customer.id
    if address.save
      flash[:notice] = "登録に成功しました。"
      redirect_to addresses_path
    else
      flash[:alert] = "登録に失敗しました。"
      redirect_to customers_my_page_path
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:notice] = "更新に成功しました。"
      redirect_to addresses_path
    else
      flash[:alert] = "更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :address, :address_name)
  end
end
