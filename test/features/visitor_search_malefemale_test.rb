require "test_helper"

feature "visitor searches for male, female, or neither" do
  scenario "visitor finds male-only restrooms" do

    visit root_path

    # input address in search bar
    fill_in "search", with: "801 NE 62nd St, Seattle, WA 98115"
    choose("malefemale_male")
    click_on "Search for restroom"

    page.text.must_include "802"

    # # map shows on page
    # page.has_css?("#map")
  end
end
