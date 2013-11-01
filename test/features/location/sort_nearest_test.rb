require "test_helper"

feature "visitor inputs address" do
  scenario "find nearest restrooms" do

    visit root_path

    # input address in address input
    fill_in "search", with: "803 NE 62nd St, Seattle, WA 98115"
    choose("malefemale_female")
    click_button "Search for restroom"

    # search in result div ID #1 for fixture
    page.first("td").text.must_include '803 NE'
  end
end
