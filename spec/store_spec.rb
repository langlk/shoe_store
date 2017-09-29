#!/usr/bin/env ruby

require 'spec_helper'

describe('Store') do
  describe '#brands' do
    it "returns all brands that a store carries" do
      store = Store.create({name: 'Westlake'})
      brand1 = store.brands.new({name: 'Converse'})
      brand2 = store.brands.new({name: 'Vans'})
      expect(store.brands).to eq([brand1, brand2])
    end
  end
end
