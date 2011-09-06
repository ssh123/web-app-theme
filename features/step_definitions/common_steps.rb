Given /^I have a new rails app$/ do
  steps %Q{
    Given I have a new rails "3.1.0" app
  }
end

Given /^I have a new rails "([^"]*)" app$/ do |version|
  random = Random.rand(20000)
  steps %Q{
    Given I run `gem install rails --version=#{version}`
    And   I run `rails _#{version}_ new test_app#{random}`
    And   I cd to "test_app#{random}"
    And   a file named "Gemfile" with:
    """
      source 'http://rubygems.org'
      gem 'rails', '#{version}'
      gem 'web-app-theme', :path => '../../../'
    """
    And I run `bundle install`
  }
end

Then /^I should have a stylesheet named "([^"]*)"$/ do |css_file_name|
  steps %Q{
    Then I should have a file named "#{css_file_name}" inside the folder "app/assets/stylesheets"
  }
end

Then /^I should have a public\/stylesheet named "([^"]*)"$/ do |css_file_name|
  steps %Q{
    Then I should have a file named "#{css_file_name}" inside the folder "public/stylesheets"
  }
end

Then /^I should have an image named "([^"]*)"$/ do |image_name|
  steps %Q{
    Then I should have a file named "#{image_name}" inside the folder "app/assets/images"
  }
end

Then /^I should have a view named "([^"]*)"$/ do |view_name|
  steps %Q{
    Then I should have a file named "#{view_name}" inside the folder "app/views"
  }
end

Then /^I should have a layout named "([^"]*)"$/ do |layout_name|
  steps %Q{
    Then I should have a file named "#{layout_name}" inside the folder "app/views/layouts"
  }
end

Then /^I should have a file named "([^"]*)" inside the folder "([^"]*)"$/ do |path, file_name|
  steps %Q{
    When I run `ls -R #{path}`
    Then the output should contain "#{file_name}"
  }
end

Given /^I have no stylesheets$/ do
  steps %Q{
    Given I have no files inside the folder "app/assets/stylesheets"
  }
end

Given /^I have no public\/stylesheets$/ do
  steps %Q{
    Given I have no files inside the folder "public/stylesheets"
  }
end

Given /^I have no layouts$/ do
  steps %Q{
    And I have no files inside the folder "app/views/layouts"
  }
end

Given /^I have no files inside the folder "([^"]*)"$/ do |folder|
  steps %Q{
    And I run `rm -r #{folder}/*`
  }
end

Given /^I have a model named "([^"]*)"$/ do |model_name|
  steps %Q{
    Given I run `rails g model #{model_name}`
    Given I run `bundle exec rake db:migrate RAILS_ENV=test`
  }
end

Then /^The stylesheet "([^"]*)" should contain "([^"]*)"$/ do |css_file, patern|
  steps %Q{
    When I run `cat app/assets/stylesheets/#{css_file}`
    Then the output should contain "#{patern}"
  }
end

Then /^The public\/stylesheet "([^"]*)" should contain "([^"]*)"$/ do |css_file, patern|
  steps %Q{
    When I run `cat app/assets/stylesheets/#{css_file}`
    Then the output should contain "#{patern}"
  }
end

Then /^The layout "([^"]*)" should contain "([^"]*)"$/ do |layout_file, patern|
  steps %Q{
    When I run `cat app/views/layouts/#{layout_file}`
    Then the output should contain "#{patern}"
  }
end

Then /^I should not have any layouts$/ do
  steps %Q{
    Then the file "application.html.erb" should not exist
    Then the file "application.html.haml" should not exist
  }
end
