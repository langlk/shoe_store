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
  @unassigned_brands = Brand.all - @store.brands
  erb(:store)
end

get('/stores/:id/edit') do
  @section = 'stores'
  @store = Store.find(params[:id].to_i)
  erb(:store_edit)
end

patch('/stores/:id') do
  @section = 'stores'
  @store = Store.find(params[:id].to_i)
  if @store.update({name: params['name']})
    redirect '/stores/' + @store.id.to_s
  else
    erb(:store_edit)
  end
end

delete('/stores/:id') do
  @section = 'stores'
  @store = Store.find(params[:id].to_i)
  if @store.delete
    redirect '/stores'
  else
    @problem_object = @store
    erb(:errors)
  end
end

patch('/stores/:id/add-brands') do
  @section = 'stores'
  @store = Store.find(params[:id].to_i)
  brand_ids = @store.brand_ids + params['brand_ids'].map { |id| id.to_i }
  if @store.update({brand_ids: brand_ids})
    redirect '/stores/' + @store.id.to_s
  else
    @problem_object = @store
    erb(:errors)
  end
end

get('/brands') do
  @section = 'brands'
  @brands = Brand.all
  erb(:brands)
end

post('/brands/add') do
  @section = 'brands'
  @brand = Brand.new({name: params['name'], price: params['price'].to_f})
  if @brand.save
    redirect '/brands'
  else
    @brands = Brand.all
    erb(:brands)
  end
end
