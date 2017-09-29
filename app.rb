#!/usr/bin/env ruby

require("bundler/setup")
require "pry"
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @section = 'home'
  erb(:index)
end

get('/stores') do
  @section = 'stores'
  @stores = Store.all
  erb(:stores)
end

post('/stores/add') do
  @section = 'stores'
  @store = Store.new({name: params['name']})
  if @store.save
    redirect '/stores/' + @store.id.to_s
  else
    @stores = Store.all
    erb(:stores)
  end
end

get('/stores/:id') do
  @section = 'stores'
  @store = Store.find(params[:id].to_i)
  erb(:store)
end
