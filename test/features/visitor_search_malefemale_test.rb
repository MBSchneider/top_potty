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

  scenario "visitor finds female-only restrooms" do

    visit root_path

    # input address in search bar
    fill_in "search", with: "801 NE 62nd St, Seattle, WA 98115"
    choose("malefemale_female")
    click_on "Search for restroom"

    page.text.must_include "803"

    # # map shows on page
    # page.has_css?("#map")
  end

  scenario "visitor finds male and female restrooms" do
    pending # revisit once gender is drop down menu rather than radio buttons
    #visit root_path

    # input address in search bar
    #fill_in "search", with: "801 NE 62nd St, Seattle, WA 98115"

    #click_on "Search for restroom"

    #page.text.must_include "803"
    #page.text.must_include "802"

    # # map shows on page
    # page.has_css?("#map")
  end
end
