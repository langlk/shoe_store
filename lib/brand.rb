#!/usr/bin/env ruby

class Brand < ActiveRecord::Base
  has_and_belongs_to_many :stores
end
