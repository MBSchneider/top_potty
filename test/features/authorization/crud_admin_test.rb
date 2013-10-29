require "test_helper"

feature "admin deletes restroom" do
  scenario "can delete restroom from index" do

    log_in_admin

    page.find("#restroom_309456473").click_on "Destroy"

    # Then I should see success message
    page.text.must_include 'Restroom deleted.'

  end
end

feature "admin edits restroom" do
  scenario "can edit restroom from index" do

    log_in_admin

    page.find("#restroom_309456473").click_on "Edit"
    fill_in 'Location', with: "Cleveland, OH"
    choose 'Male'
    click_on 'Update Restroom'

    # Then I should see success message
    page.text.must_include 'Restroom was successfully updated.'
    page.text.must_include 'Cleveland, OH'

  end
end
