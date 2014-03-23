require "test_helper"

feature "restroom sorting by location" do
  scenario "nearest restrooms show on top" do

    visit root_path

    # input address in address input
    fill_in "address", with: "802 NE 62nd St, Seattle, WA 98115", match: :first
    find('.btn-low-margin').click

    # search in result div ID #1 for fixture
    page.first(".restroom td").text.must_include '802 NE 62nd St'
  end
end
