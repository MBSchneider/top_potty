require "test_helper"

feature "non-admin attempts to delete restroom" do
  scenario "not authorized to delete restroom" do

    log_in_user_one

    page.find("#restroom_309456473").click_on "Destroy"

    # Then I should see failure message
    page.text.must_include 'You are not authorized to perform this action.'

  end
end

feature "non-admin attempts to edit restroom" do
  scenario "not authorized to edit restroom" do

    log_in_user_one

    page.find("#restroom_309456473").click_on "Edit"

    # Then I should see failure message
    page.text.must_include 'You are not authorized to perform this action.'

  end
end
