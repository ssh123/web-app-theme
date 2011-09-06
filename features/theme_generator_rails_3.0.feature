Feature: Layout generation on Rails 3.0
  In order to create a great application and have compatibility to rails 3.0
  I should be able to generate a layout with Web App Theme

  # script/generate theme
  Scenario: Generate a layout
    Given I have a new rails "3.0.10" app
    And   I have no layouts
    And   I have no public/stylesheets
    When  I generate a theme
    Then  I should have a layout named "application.html.erb"
    And   I should have a public/stylesheet named "web-app-theme/base.css"
    And   I should have a public/stylesheet named "web-app-theme/default/style.css"

  # script/generate theme admin
  Scenario: Generate a layout with a name
    Given I have a new rails "3.0.10" app
    And   I have no layouts
    And   I generate a theme with name "admin"
    Then  I should have a layout named "admin.html.erb"
    And   I should have a public/stylesheet named "web-app-theme/base.css"
    And   I should have a public/stylesheet named "web-app-theme/default/style.css"

  # script/generate theme --theme="drastic-dark"
  Scenario: Generate a layout choosing a theme
    Given I have a new rails "3.0.10" app
    And I have no public/stylesheets
    And I generate a theme choosing the "drastic-dark" theme
    And I should have a public/stylesheet named "web-app-theme/base.css"
    And I should have a public/stylesheet named "web-app-theme/drastic-dark/style.css"

  # script/generate theme --theme=bec --no_layout
  Scenario: Generate only stylesheets without layout
    Given I have a new rails "3.0.10" app
    And I have no layouts
    And I generate a theme without layout choosing the "bec" theme
    Then I should have a public/stylesheet named "web-app-theme/base.css"
    And I should have a public/stylesheet named "web-app-theme/bec/style.css"
    But I should not have any layouts

  # script/generate theme --app_name="My New Application"
  Scenario: Generate layout with application name
    Given I have a new rails "3.0.10" app
    And I have no layouts
    And I generate a theme with application name "My New Application"
    Then The layout "application.html.erb" should contain "My New Application"

  # script/generate theme --type=sign
  Scenario: Generate layout for signin and signup
    Given I have a new rails "3.0.10" app
    And I have no layouts
    And I generate a theme for signin and signup
    Then I should have a layout named "sign.html.erb"
    And I should have a layout named "sign.html.erb"

