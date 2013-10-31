require "test_helper"

feature "visitor inputs address" do
  scenario "find nearest restrooms" do

    visit root_path

    # input address in address input
    fill_in "search", with: "511 Boren Ave N, Seattle, WA"
    choose("malefemale_male")
    click_button "Search for restroom"

    # search in result div ID #1 for fixture
    page.first("td").text.must_include '511 Boren'
  end
end
