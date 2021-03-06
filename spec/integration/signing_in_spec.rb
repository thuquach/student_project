require 'spec_helper'

feature 'Signing in' do
  before do
    Factory(:student, :email => "student@example.com")
  end

  scenario 'Signing in via form' do
    Student.find_by_email('student@example.com')
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', :with => "student@example.com"
    fill_in 'Password', :with => "password"
    click_button "Sign in"
    page.should have_content("Signed in successfully.")
  end
end
