ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
require "minitest/rails/capybara"

# Uncomment for awesome colorful output
# require "minitest/pride"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  fixtures :all

class ActionDispatch::IntegrationTest
  include Rails.application.routes.url_helpers
  include Capybara::DSL
end

Turn.config.format = :outline
end

def log_in_user_one
  visit root_path

  click_link "Log In"

  # given a complete log in form
  fill_in "Email", with: users(:one).email
  fill_in "Password", with: 'password'

  click_button "Sign in"
end

def log_in_admin
  visit root_path

  click_link "Log In"

  # given a complete log in form
  fill_in "Email", with: users(:three).email
  fill_in "Password", with: 'password'

  click_button "Sign in"
end
