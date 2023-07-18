class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :ordre_details, dependent: :destroy

  validates :image, presence: true
  validates :genre_id, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  # 税込価格を求めるメソッド
  def with_tax_price
    (price * 1.1).floor
  end
end
