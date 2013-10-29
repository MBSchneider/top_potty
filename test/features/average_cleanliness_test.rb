require "test_helper"

feature "restrooms cleanliness rating shows average and total of all ratings" do
  scenario "index shows average cleanliness ratings and total ratings" do
    sign_in(:one)

    visit new_restroom_path

    fill_in 'Location', with: "123 Oak Rd."
    choose 'Male'
    select '6', from: "Cleanliness rating"

    click_on 'Create Restroom'

    click_on 'Add Cleanliness rating'

    select '3', from: "Cleanliness rating"

    click_on 'Create Cleanliness rating'
    click_on 'Back'

    page.text.must_include '4.5'
    page.text.must_include '2 reviews total'

  end

  scenario "individual restroom shows average cleanliness ratings and total ratings" do

    sign_in(:one)

    visit new_restroom_path

    fill_in 'Location', with: "123 Oak Rd."
    choose 'Male'
    select '6', from: "Cleanliness rating"

    click_on 'Create Restroom'

    click_on 'Add Cleanliness rating'

    select '3', from: "Cleanliness rating"

    click_on 'Create Cleanliness rating'

    page.text.must_include '4.5'
    page.text.must_include '2 reviews total'

  end
end
