#!/usr/bin/env ruby

require 'spec_helper'

describe('Store') do
  describe '#save' do
    it "does not allow name to be blank" do
      store = Store.new({name: ''})
      expect(store.save).to eq(false)
    end

    it "requires store names to be unique, ignoring case" do
      store1 = Store.create({name: 'Northgate'})
      store2 = Store.new({name: 'northgate'})
      expect(store2.save).to eq(false)
    end

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
