Feature: Assets Generator with rails 3.0
  In order to customize my great application layout and keep rails 3.0 compatibility
  I should be able to copy web-app-theme default's styles to my application assets path

  # script/generate theme
  Scenario: Generate assets
    Given I have a new rails "3.0.10" app
    When I generate assets
    Then I should have a public/stylesheet named "web-app-theme/base.css"
    And  I should have a public/stylesheet named "web-app-theme/themes/default/style.css"

  # script/generate theme
  Scenario: Generate assets with --theme=red
    Given I have a new rails "3.0.10" app
    And I have no stylesheets
    When I generate assets choosing the "red" theme
    Then I should have a public/stylesheet named "web-app-theme/base.css"
    And  I should have a public/stylesheet named "web-app-theme/themes/red/style.css"

