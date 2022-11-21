require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save correctly if everything is filled in' do
      @category = Category.create!(name: 'Bushes')
      @product = Product.new(name: 'rasberry', price: 1000, quantity: 200, category: @category);
      expect(@product.save).to be true
    end
    it 'should not save without a name' do
      @category = Category.create!(name: 'Bushes')
      @product = Product.create( price: 1000, quantity: 200, category: @category)
      expect(@product.errors.full_messages).to include('Name can\'t be blank')
    end

    it 'should not save without a price' do
      @category = Category.create!(name: 'Trees')
      @product = Product.create(name: "Apple", quantity: 50, category: @category)
      expect(@product.errors.full_messages).to include('Price can\'t be blank')
    end

    it 'should not save without a quantity' do
      @category = Category.create!(name: 'Bushes')
      @product = Product.create(name: "raspberry", price: 1000, category: @category)
      expect(@product.errors.full_messages).to include('Quantity can\'t be blank')
    end

    it 'should not save without a category' do
      @product = Product.create(name: 'rasberry', price: 10000, quantity: 250)
      expect(@product.errors.full_messages).to include('Category can\'t be blank')
    end
  end
end
