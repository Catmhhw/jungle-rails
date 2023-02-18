require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'should fail to save without a name' do
      category = Category.create(name: 'Flowers')
      product = Product.new(
        name: nil,
        price: 50,
        quantity: 12,
        category: category
      )
      expect(product.save).to be false
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

      it 'fails to save without a name' do
      category = Category.create(name: 'Flowers')
      product = Product.new(
        name: nil,
        price: 25,
        quantity: 20,
        category: category
      )
      expect(product.save).to be false
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should fail to save without a price' do
      category = Category.create(name: 'Flowers')
      product = Product.new(
        name: 'Peonies',
        price: nil,
        quantity: 20,
        category: category
      )
      expect(product.save).to be false
      expect(product.errors.full_messages).to include("Price must be greater than 0")
    end

    it 'should fail to save without a quantity' do
      category = Category.create(name: 'Flowers')
      product = Product.new(
        name: 'Roses',
        price: 10,
        quantity: nil,
        category: category
      )
      expect(product.save).to be false
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should fail to save without a category' do
      category = Category.create(name: 'Flowers')
      product = Product.new(
        name: 'Tulips',
        price: 5,
        quantity: 20,
        category: nil
      )
      expect(product.save).to be false
      expect(product.errors.full_messages).to include("Category can't be blank")
      expect(product.errors.full_messages).to include("Category must exist")
    end

    it 'should successfully save with all four fields set' do
      category = Category.create(name: 'Flowers')
      product = Product.new(
        name: 'Hydrangeas',
        price: 17,
        quantity: 34,
        category: category
      )
      expect(product.save).to be true
    end

  end
end
