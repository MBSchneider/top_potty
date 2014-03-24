require 'test_helper'

feature 'admin deletes restroom' do
  scenario 'can delete restroom from index' do

    log_in_admin
    search_in_seattle

    page.find('#restroom_309456473').click_on 'Destroy'

    # Then I should see success message
    page.text.must_include 'Restroom deleted.'

  end
end

feature 'admin edits restroom' do
  scenario 'can edit restroom from index' do

    log_in_admin
    search_in_seattle

    page.find('#restroom_309456473').click_on 'Edit'
    fill_in 'Address', with: 'Cleveland, OH'
    choose 'Male'
    fill_in 'Found within...', with: 'Park'

    click_on 'Update this restroom'

    # Then I should see success message
    page.text.must_include 'Restroom was successfully updated.'
    page.text.must_include 'Cleveland, OH'

  end
end

feature 'admin adds restroom' do
  Capybara.javascript_driver = :poltergeist
  scenario 'can add a restroom', js: true do

    log_in_admin
    click_on '+ADD NEW+'

    fill_in 'prelim_address', with: restrooms(:fifth).location, match: :first
    find('#new_rr_search').click
    sleep 2
    find('#add_new').click
    choose 'Male'
    select '1',
           from: 'restroom_cleanliness_ratings_attributes_0_cleanlinessrating'
    fill_in 'restroom_foundwithin', with: 'Sears'

    click_on 'Add this restroom'

    # Then I should see success message
    page.text.must_include '1st and pike seattle wa'
    page.text.must_include '1.0'

  end
end

feature 'admin views restroom, show action' do
  scenario 'can view restroom show page' do

    log_in_admin
    search_in_seattle

    page.find('#restroom_309456473 > td > a', match: :first).click

    # Then I should see success message
    page.text.must_include restrooms(:first).location

  end
end
