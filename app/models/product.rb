class Product < ApplicationRecord
  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category

  validates :name, presence: true
  # validates :price, presence: true
  validates :price, numericality: {greater_than: 0}
  # validate :price_presence
  validates :quantity, presence: true
  validates :category, presence: true

  # private
  # def price_presence ()
  #   if price.nil? || price_cents.nil? || price_cents == 0
  #     errors.add(:price, "can't be blank")
  #   end
  # end
end
