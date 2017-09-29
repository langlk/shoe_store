require "spec_helper"

describe 'the store CRUD path', { type: :feature } do
  it "allows user to create and view stores" do
    visit('/stores')
    fill_in('name', with: 'Alderwood')
    click_button('Create Store')
    expect(page).to have_content('Alderwood')
  end

  it "allows the user to edit stores" do
    visit('/stores')
    fill_in('name', with: 'Alderwood')
    click_button('Create Store')
    click_link('Edit')
    fill_in('name', with: 'Crossroads')
    click_button('Update Store')
    expect(page).to have_content('Crossroads')
  end

  it "allows the user to delete stores" do
    visit('/stores')
    fill_in('name', with: 'Alderwood')
    click_button('Create Store')
    click_link('Edit')
    click_button('Delete')
  end

  it "does not allow blank store names" do
    visit('/stores')
    fill_in('name', with: '')
    click_button('Create Store')
    expect(page).to have_content("Name can't be blank")
  end

  it "does not allow duplicate store names" do
    Store.create({name: 'Alderwood'})
    visit('/stores')
    fill_in('name', with: 'Alderwood')
    click_button('Create Store')
    expect(page).to have_content('Name has already been taken')
  end

  it "does not allow store names longer than 100 characters" do
    visit('/stores')
    fill_in('name', with: ('Shoes' * 50))
    click_button('Create Store')
    expect(page).to have_content('Name is too long (maximum is 100 characters)')
  end
end

describe 'the brand creation path', { type: :feature} do
  it "allows user to create a new brand" do
    visit('/brands')
    fill_in('name', with: 'Chucks')
    fill_in('price', with: '40')
    click_button('Add Brand')
    expect(page).to have_content('Chucks - $40.00')
  end

  it "does not allow blank brand name" do
    visit('/brands')
    fill_in('name', with: '')
    click_button('Add Brand')
    expect(page).to have_content("Name can't be blank.")
  end

  it "does not allow duplicate brand names" do
    Brand.create({name: 'Chucks'})
    visit('/brands')
    fill_in('name', with: 'chucks')
    click_button('Add Brand')
    expect(page).to have_content("Name has already been taken.")
  end

  it "does not allow brand names longer than 100 characters" do
    visit('/brands')
    fill_in('name', with: ('Shoes' * 50))
    click_button('Add Brand')
    expect(page).to have_content('Name is too long (maximum is 100 characters)')
  end
end

describe 'the store-brand association', { type: :feature } do
  it "lets user add brands to a store" do
    store = Store.create({name: 'Northgate'})
    brand_1 = Brand.create({name: 'Converse', price: 40.0})
    brand_2 = Brand.create({name: 'Vans', price: 45.0})
    visit('/stores/' + store.id.to_s)
    check('brand-' + brand_1.id.to_s)
    check('brand-' + brand_2.id.to_s)
    click_button('Add Brands')
    expect(store.brands).to eq([brand_1, brand_2])
  end

  it "removes brands from the add brands section when they've been assigned to the store" do
    store = Store.create({name: 'Northgate'})
    brand_1 = Brand.create({name: 'Converse', price: 40.0})
    brand_2 = Brand.create({name: 'Vans', price: 45.0})
    store.update({brand_ids: [brand_1.id]})
    visit('/stores/' + store.id.to_s)
    expect(page).to have_no_content('Add Brands to Store Converse')
  end
end
