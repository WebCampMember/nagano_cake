class Order < ApplicationRecord
  belongs_to :customer
  has_many :ordre_details
end
