class Product < ApplicationRecord
  monetize :price_cents, numericality: true, allow_nil: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category

  validates :name, presence: true
  validates :price, presence: true
  # validates :price, presence: true, numericality: {greater_than_or_equal_to: 0}
  # validate :price_presence
  validates :quantity, presence: true
  validates :category, presence: true

  # private
  # def price_presence ()
  #   # puts 'price before if'
  #   # p price
  #   # p errors
  #   if price.nil? 
  #     # || price_cents.nil? || price_cents == 0
  #     errors.add(:price, "can't be blank")
  #   end
  # end
end
