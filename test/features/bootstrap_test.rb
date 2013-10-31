require "test_helper"

feature "bootstrap makes our site pretty" do
  scenario "bootstrap loads fine" do
    sign_in(:one)

    visit root_path

    page.has_css? 'cc9' #color of table th

  end

end
