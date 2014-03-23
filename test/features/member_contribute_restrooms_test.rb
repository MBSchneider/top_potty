require "test_helper"

feature "Member can contribute restrooms" do
  scenario "Member adds new restroom location", js: true do

    visit new_user_session_path
    fill_in "Email", with: users(:one).email
    fill_in "Password", with: "password"
    click_on "Sign in"

    # visit new_restroom_path
    # fill_in('#newrr_search', :with => '50th and university seattle')
    # find('.input-append').choose('Male')
    # click_on 'Next'
    # page.text.must_include 'If any of the below match your restroom'

    # find('#add_new').click

    # fill_in 'restroom_foundwithin', with: "Jack in the Box"
    # check "#restroom_outlets"



    # choose '.input-append Male'
    # select '6', from: "Cleanliness rating"
    # fill_in 'Found within...', with: "Mall"

    # click_on 'Create Restroom'

    page.text.must_include 'Signed in'

  end
end
