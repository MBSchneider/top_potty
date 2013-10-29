require "test_helper"

feature "visitor signs up for account" do
  scenario "sign up for account" do

    visit root_path

    click_link "Sign Up"

    # given a complete sign up form
    fill_in 'Email', with: "abc@def.com"
    fill_in 'Password', with: "password"
    fill_in 'Password confirmation', with: "password"

    click_button "Sign up"

    # Then I should see success message
    page.text.must_include 'You have signed up successfully.'

  end
end
