#!/usr/bin/env ruby

class Brand < ActiveRecord::Base
  has_and_belongs_to_many :stores
  before_save :capitalize_name

private
  def capitalize_name
    self.name = self.name.capitalize.split.reduce { |full_name, word| full_name + " " + word.capitalize }
  end
end
