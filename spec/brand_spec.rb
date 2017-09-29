#!/usr/bin/env ruby

require 'spec_helper'

describe('Brand') do
  describe '#stores' do
    it "returns a list of all stores that carry a brand" do
      brand = Brand.create({name: 'Converse'})
      store1 = brand.stores.new({name: 'Northgate'})
      store2 = brand.stores.new({name: 'Westlake'})
      expect(brand.stores).to eq([store1, store2])
    end
  end
end
