#!/usr/bin/env ruby

require("bundler/setup")
require "pry"
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @section = 'home'
  erb(:index)
end
