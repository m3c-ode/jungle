require 'rails_helper'

RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe 'Validations' do
    before(:each) do
      @category = Category.create(name: 'Flowers')
      # @product = Product.new
      # p @category
    end
    # validation and etst examples
    it 'validates creation of a neew proudct with all 4 attributes' do
      product = Product.create(
        name: 'product',
        price: 2000,
        quantity: 20,
        category: @category
      )
      expect(product).to be_valid
    end
    it 'validates presence of name' do
      product = Product.create(
        name: nil,
        price: 20,
        quantity: 20,
        category: @category
      )
      # puts 'product errors'
      # p product.errors.full_messages
      expect(product).to_not be_valid
      expect(product.errors.full_messages[0]).to include "can't be blank"
    end
    it 'validates presence of price' do
      product = Product.create(
        name: 'product',
        price: nil,
        quantity: 20,
        category: @category
      )
      # puts 'price errors'
      # p product.errors.full_messages
      # print 'product valid?: '
      # p product.valid?
      # p product
      expect(product).to_not be_valid
      # if use my custom validate callback
      # expect(product.errors.full_messages[0]).to include "can't be blank"

      # if use validates on numericality
      expect(product.errors.full_messages[0]).to include "must be greater than 0"
    end
    it 'validates presence of quantity' do
      product = Product.create(
        name: 'product',
        price: 2000,
        quantity: nil,
        category: @category
      )
      expect(product).to_not be_valid
      expect(product.errors.full_messages[0]).to include "can't be blank"
    end
    it 'validates presence of category' do
      product = Product.create(
        name: 'product',
        price: 2000,
        quantity: 20,
        category: nil
      )
      expect(product.errors.full_messages[0]).to include "must exist"
      expect(product).to be_invalid
    end
  end
end
