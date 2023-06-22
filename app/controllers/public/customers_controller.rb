class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      # flash[:success] = "You have updated user successfully."
      redirect_to customers_my_page_path
    else
      render :edit
    end
  end

  def confirm_withdraw
  end

  def withdraw
    @customer = current_customer
    redirect_to destroy_admin_session_path, method: :delete
    @customer.update(is_deleted: true)
  end

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana,
    :first_name_kana, :postal_code, :address, :telephone_number)
  end
end
