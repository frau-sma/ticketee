When /^I create a ticket$/ do
  click_link 'New Ticket'
end

When /^I fill in valid ticket information$/ do
  fill_in 'Title', :with => 'Non-standards compliance'
  fill_in 'Description', :with => 'My pages are ugly!'
  click_button 'Create Ticket'
end

Then /^I should see the ticket created verification message$/ do
  page.should have_content 'Ticket has been created.'
end

Then /^I should be on the new ticket's page$/ do
  project = Project.find_by_name!('TextMate 2')
  ticket = project.tickets.find_by_title!('Non-standards compliance')
  current_path.should == project_ticket_path(project, ticket)
end

When /^I fill in invalid ticket information$/ do
  click_button 'Create Ticket'
end

Then /^I should be informed that the ticket has not been created$/ do
  page.should have_content 'Ticket has not been created.'
end

Then /^I should be told that the title is required$/ do
  page.should have_content "Title can't be blank"
end

Then /^I should be told that the description is required$/ do
  page.should have_content "Description can't be blank"
end

When /^I fill in information with a short description$/ do
  fill_in 'Title', :with => 'Non-standards compliance'
  fill_in 'Description', :with => 'too short'
  click_button 'Create Ticket'
end

Then /^I should be told that the description is too short$/ do
  page.should have_content 'Description is too short'
end
