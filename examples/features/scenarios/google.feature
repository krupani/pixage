Feature: As a pixie user, I want to see an example of how to use pixie for automation cases

# Runtime screenshot comparison
Scenario: Compare the difference in google UAE and google India pages
	Given I am on google "uae" page
	And I capture a screenshot named "uae"
	When I am on google "india" page
	And I capture a screenshot named "india"
	Then I compare "uae" with "india" screenshots to generate diff


# Runtime screenshot comarison with a baseline image previously saved
Scenario: Compare the difference in google page on two different days
	Given I am on google "uae" page
	And I capture a screenshot named "uae"
	Then I compare "uae" with "baseline" screenshots to generate diff
