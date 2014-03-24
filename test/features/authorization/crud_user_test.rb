require 'test_helper'

feature 'non-admin attempts to delete restroom' do
  scenario 'not authorized to delete restroom' do

    log_in_user_one

    page.text.wont_include 'Destroy'

  end
end

feature 'non-admin attempts to edit restroom' do
  scenario 'not authorized to edit restroom' do

    log_in_user_one

    page.text.wont_include 'Edit'

  end
end
