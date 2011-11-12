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

Given /^the project has a ticket$/ do
  @project.tickets.create!(:title => 'Make it shiny!', :description => 'Gradients! Starbursts! Oh my!')
end

Given /^another project exists$/ do
  @project = Factory(:project, :name => 'Project #2')
end

Given /^the second project has a different ticket$/ do
  @project.tickets.create!(:title => 'Standards compliance', :description => "Isn't a joke.")
end

Then /^I should see the first project's ticket$/ do
  page.should have_content 'Make it shiny!'
end

Then /^I should not see the second project's ticket$/ do
  page.should_not have_content 'Standards compliance'
end

When /^I navigate to the first ticket's page$/ do
  click_link 'Make it shiny!'
end

Then /^I should see the first ticket's information$/ do
  page.find('#ticket h2').should have_content 'Make it shiny!'
  page.should have_content 'Gradients! Starbursts! Oh my!'
end

When /^I go back to the home page$/ do
  click_link 'Ticketee'
end

When /^I navigate to the second project's page$/ do
  click_link 'Project #2'
end

Then /^I should see the second project's ticket$/ do
  page.should have_content 'Standards compliance'
end

Then /^I should not see the first project's ticket$/ do
  page.should_not have_content 'Make it shiny!'
end

When /^I navigate to the second ticket's page$/ do
  click_link 'Standards compliance'
end

Then /^I should see the second ticket's information$/ do
  page.find('#ticket h2').should have_content 'Standards compliance'
  page.should have_content "Isn't a joke."
end

When /^I ask to edit the ticket$/ do
  click_link 'Edit Ticket'
end

When /^I fill in valid new ticket information$/ do
  fill_in 'Title', :with => 'Make it really shiny!'
  click_button 'Update Ticket'
end

Then /^I should see the ticket updated verification message$/ do
  page.should have_content 'Ticket has been updated.'
end

Then /^I should be on the updated ticket's page$/ do
  project = Project.find_by_name!('TextMate 2')
  ticket = project.tickets.find_by_title!('Make it really shiny!')
  current_path.should == project_ticket_path(project, ticket)
  page.should have_content 'Make it really shiny!'
  page.should_not have_content 'Make it shiny!'
end

When /^I fill in invalid new ticket information$/ do
  fill_in 'Title', :with => ''
  click_button 'Update Ticket'
end

Then /^I should be informed that the ticket has not been updated$/ do
  page.should have_content 'Ticket has not been updated.'
end

When /^I ask for the ticket to be deleted$/ do
  click_link 'Delete Ticket'
end

Then /^I should see the ticket deleted verification message$/ do
  page.should have_content 'Ticket has been deleted.'
end
