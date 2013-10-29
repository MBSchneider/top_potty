require "test_helper"

feature "visitor signs up for account" do
  scenario "sign up for account" do

    visit root_path

    log_in_user_one

    # Click log out
    click_link "Log Out"

    # Then I should see success message
    page.text.must_include 'Signed out successfully.'

  end
end
