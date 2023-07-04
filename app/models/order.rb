class Order < ApplicationRecord
  belongs_to :customer
  has_many :ordre_details

  enum pay_method: { credit_card: 0, transfer: 1 }
  # enum status: { waiting: 0, confirmation: 1, production: 2, preparation: 3, completion: 4 }
end
