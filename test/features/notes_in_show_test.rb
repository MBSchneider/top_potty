require "test_helper"

feature "restroom show view shows notes" do
  scenario "visitor can see notes in restroom show view" do

    sign_in(:one)
    first(:link, 'Rate / Add Note').click

    fill_in 'Note', with: "Wackadoo I love this one."

    click_on 'Create Note'

    page.text.must_include 'Wackadoo'

  end
end
