#!/usr/bin/env ruby

require 'spec_helper'

describe('Brand') do
  describe '#save' do
    it "does not allow name to be blank" do
      brand = Brand.new({name: ''})
      expect(brand.save).to eq(false)
    end

    it "requries brand names to be unique, ignoring case" do
      brand1 = Brand.create({name: 'converse'})
      brand2 = Brand.new({name: 'CONVERSE'})
      expect(brand2.save).to eq(false)
    end

    it "capitalizes brand name before saving" do
      brand = Brand.new({name: 'converse ALLstar'})
      brand.save
      expect(brand.name).to eq('Converse Allstar')
    end
  end

  describe '#stores' do
    it "returns a list of all stores that carry a brand" do
      brand = Brand.create({name: 'Converse'})
      store1 = brand.stores.new({name: 'Northgate'})
      store2 = brand.stores.new({name: 'Westlake'})
      expect(brand.stores).to eq([store1, store2])
    end
  end

  describe '#price_string' do
    it "returns the price formatted as a US dollar amount" do
      brand = Brand.create({name: 'Converse', price: 50})
      expect(brand.price_string).to(eq('$50.00'))
    end
  end
end
