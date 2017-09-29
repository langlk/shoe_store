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

  it "allows the user to delet stores" do
    visit('/stores')
    fill_in('name', with: 'Alderwood')
    click_button('Create Store')
    click_link('Edit')
    click_button('Delete')
  end
end
