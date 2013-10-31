require "test_helper"

feature "bootstrap makes our site pretty" do
  scenario "bootstrap loads fine" do
    sign_in(:one)

    visit root_path

    page.body.must_include('navbar-brand2')

  end

end
