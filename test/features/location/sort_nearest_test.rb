require "test_helper"

feature "visitor inputs address" do
  scenario "find nearest restrooms" do

    visit root_path

    # input address in address input
    fill_in "Location", with: "511 Boren Ave N, Seattle, WA"

    # search in result div ID #1 for fixture
    page.find("#result_1").text.must_include '511 Boren'
  end
end
