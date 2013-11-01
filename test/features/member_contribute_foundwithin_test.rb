require "test_helper"

feature "Member can contribute foundwithin data" do
  scenario "Member adds new foundwithin information" do

    sign_in(:one)

    visit new_restroom_path

    fill_in 'Address', with: "123 Oak Rd."
    fill_in 'Found within', with: "PCC"
    choose 'Male'
    select '6', from: "Cleanliness rating"

    click_on 'Create Restroom'

    page.text.must_include 'PCC'

  end
end
