require "test_helper"

feature "Member can contribute restrooms" do
  scenario "Member adds new restroom location" do
    log_in_user_one

    visit new_restroom_path

    fill_in 'Location', with: "123 Oak Rd."
    choose 'Male'
    select '6', from: "Cleanliness rating"

    click_on 'Create Restroom'

    page.text.must_include 'successfully created'

  end
end
