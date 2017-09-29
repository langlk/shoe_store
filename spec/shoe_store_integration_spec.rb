require "spec_helper"

describe 'the store CRUD path', {type: :feature} do
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
end
