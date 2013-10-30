require "test_helper"

feature "only members can add cleanliness ratings" do
  scenario "visitor prompted to log in when clicking add cleanliness rating" do

    visit root_path
    click_link("Add Cleanliness rating", :match => :first)
    page.text.must_include "You need to sign in"

  end
end
