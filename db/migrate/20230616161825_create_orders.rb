class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer   :customer_id, null: false
      t.string    :postal_code, null: false
      t.string    :address, null: false
      t.string    :address_name, null: false
      t.integer   :pay_method, null: false, default: 0
      t.integer   :postage, null: false
      t.integer   :pay_money, null: false
      t.integer   :status, null: false, default: 0
      t.timestamps
    end
  end
end
