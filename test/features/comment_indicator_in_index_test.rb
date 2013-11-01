require "test_helper"

feature "index shows comments are available to view" do
  scenario "visitor can see link in index to view comment" do

    sign_in(:one)

    visit new_restroom_path

    fill_in 'Address', with: "123 Oak Rd."
    choose 'Male'
    select '10', from: "Cleanliness rating"
    fill_in 'Comment', with: "This be a comment"
    fill_in 'Found within...', with: "Store"

    click_on 'Create Restroom'
    click_on 'Back'

    page.text.must_include 'See comment'

  end
end
