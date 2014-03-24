require 'test_helper'

feature 'TPBadge icon marks the best restrooms' do
  scenario 'Image for restrooms with rating over 8.8', js: true do

    visit root_path

    fill_in 'address',
            with: 'n 130th st and aurora ave n, seattle wa',
            match: :first

    find('.btn-low-margin').click

    find('.restroom > td', match: :first).has_css?('img').must_equal true

  end
  scenario 'No image for restrooms with rating under 8.8', js: true do

    visit root_path

    fill_in 'address', with: restrooms(:first).location, match: :first
    find('.btn-low-margin').click

    find('.restroom > td', match: :first).has_css?('img').must_equal false

  end
end
