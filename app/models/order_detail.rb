class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  def subtotal
    item.with_tax_price * amount
  end
  
  def total
    # 繰り返し計算する処理を記述する
    result = 0
    order.order_details.each do |n|
      result += n.amount
    end
    result
  end
end
