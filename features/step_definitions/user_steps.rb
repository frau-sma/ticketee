When /^I navigate to the sign\-up page$/ do
  click_link 'Sign Up'
end

When /^I fill in valid user information$/ do
  fill_in 'Email', :with => 'user@ticketee.org'
  fill_in 'Password', :with => 'password'
  fill_in 'Password confirmation', :with => 'password'
  click_button 'Sign up'
end

Then /^I should see the sign\-up verification message$/ do
  page.should have_content 'You have signed up successfully.'
end

Given /^I am an unconfirmed user$/ do
  @user = User.create!(:email => 'user@ticketee.org', :password => 'password')
end

Then /^I should see the registration confirmation message$/ do
  page.should have_content 'Your account was successfully confirmed.'
end

Then /^I should be signed in$/ do
  page.should have_content 'Signed in [user@ticketee.org]'
end

Given /^I am a confirmed user$/ do
  @user = User.create!(:email => 'user@ticketee.org', :password => 'password')
  @user.confirm!
end

When /^I navigate to the sign\-in page$/ do
  click_link 'Sign In'
end

When /^I fill in my user details$/ do
  fill_in 'Email', :with => 'user@ticketee.org'
  fill_in 'Password', :with => 'password'
  click_button 'Sign in'
end

Given /^I am an admin user$/ do
  @user = User.create!(:email => 'user@ticketee.org', :password => 'password')
  @user.update_attribute('admin', true)
  @user.confirm!
end

Given /^I am signed in$/ do
  steps(%Q{
    Given I am on the home page
    When I navigate to the sign-in page
    And I fill in my user details
    Then I should be signed in
  })
end
