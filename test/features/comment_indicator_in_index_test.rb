require "test_helper"

feature "index shows comments are available to view" do
  scenario "visitor can see link in index to view comment", js: true do
    sign_in(:one)

    click_on '+ADD NEW+'

    fill_in 'prelim_address', with: '65th and latona seattle, wa', match: :first
    find('#new_rr_search').click
    sleep 2
    find('#add_new').click
    choose 'Male'
    select '7', from: 'restroom_cleanliness_ratings_attributes_0_cleanlinessrating'
    fill_in 'Notes', with: 'Not bad'
    fill_in 'restroom_foundwithin', with: 'Latona Pub'

    click_on 'Add this restroom'
    visit root_path

    fill_in 'address', with: '65th and latona seattle, wa', match: :first
    find('.btn-low-margin').click

    find('.restroom', match: :first).text.must_include '1 comments'

  end
end
