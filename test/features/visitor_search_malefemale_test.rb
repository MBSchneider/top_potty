require "test_helper"

feature "visitor searches for male, female, or neither" do
  scenario "visitor finds male-only restrooms" , js: true do
    visit root_path

    click_on 'More search options'
    within '#searchfilters' do
      fill_in "address", with: restrooms(:fourth).location
      choose 'q_malefemale_eq_male'
      click_on 'Search'
    end

    page.text.must_include restrooms(:third).location
    page.text.wont_include restrooms(:fourth).location

    # # map shows on page
    # page.has_css?("#map")
  end

  scenario "visitor finds female-only restrooms" , js: true do
    visit root_path

    click_on 'More search options'
    within '#searchfilters' do
      fill_in "address", with: restrooms(:fourth).location
      choose 'q_malefemale_eq_female'
      click_on 'Search'
    end

    page.text.must_include restrooms(:fourth).location
    page.text.wont_include restrooms(:third).location

    # # map shows on page
    # page.has_css?("#map")
  end

  scenario "visitor finds male and female restrooms", js: true do
    visit root_path

    click_on 'More search options'
    within '#searchfilters' do
      fill_in "address", with: restrooms(:fourth).location
      click_on 'Search'
    end

    page.text.must_include restrooms(:fourth).location
    page.text.must_include restrooms(:third).location

    # map shows on page
    # page.has_css?("#map")
  end
end
