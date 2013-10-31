require "test_helper"

feature "TPBadge icon marks the best restrooms" do
  scenario "TPBadge picture displays for restrooms with clean rating over 8.8" do
    sign_in(:one)

    visit new_restroom_path

    fill_in 'Location', with: "123 Oak Rd."
    choose 'Male'
    select '10', from: "Cleanliness rating"

    click_on 'Create Restroom'
    click_on 'Back'

    page.has_xpath?("//img[@src=\"/assets/tpbadge.png\"]")

  end
end
