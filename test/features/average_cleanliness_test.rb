require 'test_helper'

feature 'restrooms rating shows avg and total of all ratings' do
  scenario 'view page shows avg and total ratings' do
    sign_in(:one)

    visit restroom_path(restrooms(:fifth))
    click_on 'Add Cleanliness Rating / Note'
    select '7'
    click_on 'Submit'

    page.text.must_include '4.5'
    page.text.must_include '2 reviews'
  end
  Capybara.javascript_driver = :webkit
  scenario 'index shows avg and total ratings', js: true do

    log_in_admin
    click_on '+ADD NEW+'

    fill_in 'prelim_address',
            with: '45th and latona seattle, wa',
            match: :first

    find('#new_rr_search').click
    sleep 2
    find('#add_new').click
    choose 'Male'
    select '1',
           from: 'restroom_cleanliness_ratings_attributes_0_cleanlinessrating'
    fill_in 'restroom_foundwithin', with: 'Sears'

    click_on 'Add this restroom'
    sleep 3

    visit restroom_path(Restroom.last)
    click_on 'Add Cleanliness Rating / Note'
    select '4'
    click_on 'Submit'

    visit restrooms_path

    fill_in('address', match: :first, with: 'Seattle, WA')
    find('.btn-low-margin').click

    page.text.must_include '2.5'
    page.text.must_include '2 reviews'
  end

end
