Given /^I am on the home page$/ do
  visit '/'
end

When /^I navigate to the project creation page$/ do
  click_link 'New Project'
end

When /^I create a new project$/ do
  fill_in 'Name', :with => 'TextMate 2'
  click_button 'Create Project'
end

Then /^I should see the project created verification message$/ do
  page.should have_content 'Project has been created.'
end

When /^I try to create a project without a name$/ do
  click_button 'Create Project'
end

Then /^I should be informed that the project has not been created$/ do
  page.should have_content 'Project has not been created.'
end

Then /^I should be told that the name is required$/ do
  page.should have_content "Name can't be blank"
end

Given /^a project exists$/ do
  Factory(:project, :name => 'TextMate 2')
end

When /^I navigate to the project's page$/ do
  click_link 'TextMate 2'
end

Then /^I should be on the relevant project page$/ do
  current_path.should == project_path(Project.find_by_name!('TextMate 2'))
  page.should have_content('TextMate 2 :: Projects :: Ticketee')
end

