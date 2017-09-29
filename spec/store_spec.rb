#!/usr/bin/env ruby

require 'spec_helper'

describe('Store') do
  describe '#save' do
    it "capitalizes store name before saving" do
      store = Store.new({name: 'northGate'})
      store.save
      expect(store.name).to eq('Northgate')
    end
  end
  
  describe '#brands' do
    it "returns all brands that a store carries" do
      store = Store.create({name: 'Westlake'})
      brand1 = store.brands.new({name: 'Converse'})
      brand2 = store.brands.new({name: 'Vans'})
      expect(store.brands).to eq([brand1, brand2])
    end
  end
end
