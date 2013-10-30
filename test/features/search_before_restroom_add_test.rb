require "test_helper"

feature "member is asked to search before adding restroom" do

  scenario "member can't see real add restroom link until add search performed" do

    sign_in(:one)
    visit root_path

    page.text.wont_include "Add a new restroom!"

    # # map shows on page
    # page.has_css?("#map")
  end

  scenario "member searches before seeing add restroom link" do

    sign_in(:one)
    visit root_path

    click_on "ADD NEW RESTROOM"

    click_on "Search for existing restroom"

    page.text.must_include "Add a new restroom!"

  end

end
