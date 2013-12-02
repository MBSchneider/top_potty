require "test_helper"

feature "Member can contribute foundwithin data" do
  scenario "Member adds new foundwithin information", :js => true do

    log_in_user_one

    visit new_restroom_path
    save_and_open_page

    fill_in 'newrr_search', with: "85th and aurora seattle"
    choose 'Male'
    click_on 'Next'



    # fill_in 'Found within', with: "PCC"

    # select '6', from: "Cleanliness rating"



    # page.text.must_include 'PCC'

  end
end
