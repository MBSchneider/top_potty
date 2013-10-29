require "test_helper"

feature "visitor logs out of account" do
  scenario "log out" do

    visit root_path

    log_in_user_one

    # Click log out
    click_link "Log Out"

    # Then I should see success message
    page.text.must_include 'Signed out successfully.'

  end
end
