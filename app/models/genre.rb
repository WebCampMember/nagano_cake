class Genre < ApplicationRecord
  has_many :items, dependent: :update
end
