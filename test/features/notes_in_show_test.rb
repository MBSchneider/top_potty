require "test_helper"

feature "restroom show view shows notes" do
  scenario "visitor can see notes in restroom show view" do

    sign_in(:one)

    fill_in('address', match: :first, with: '87th and aurora Seattle, WA')
    find('span > .btn-low-margin', match: :first).click
    sleep 1
    find('td > a', match: :first).click
    click_on 'Add Cleanliness Rating / Note'

    fill_in 'Note', with: "Wackadoo I love this one."

    click_on 'Submit'

    page.text.must_include 'Wackadoo'

  end
end
