require "test_helper"

feature "visitor inputs address" do
  scenario "find nearest restrooms" do

    visit root_path

    # input address in address input
    fill_in "search", with: "511 Boren Ave N, Seattle, WA"
    click_button "Search Near"

    save_and_open_page

    # search in result div ID #1 for fixture
    page.first("td").text.must_include '511 Boren'
  end
end
