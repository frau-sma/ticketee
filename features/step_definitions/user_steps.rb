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
