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

Given /^there is a user$/ do
  @user = User.create!(:email => 'user@ticketee.com', :password => 'password')
end

Then /^I should see the registration confirmation message$/ do
  page.should have_content 'Your account was successfully confirmed.'
end

Then /^I should be signed in$/ do
  page.should have_content 'Signed in [user@ticketee.com]'
end
