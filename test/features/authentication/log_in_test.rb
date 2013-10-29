require "test_helper"

feature "visitor logs in to previously existing account" do
  scenario "log in to account" do

    visit root_path

    click_link "Log In"

    # given a complete log in form
    fill_in "Email", with: users(:one).email
    fill_in "Password", with: 'password'

    click_button "Sign in"

    # Then I should see success message
    page.text.must_include 'Signed in successfully.'

  end
end
