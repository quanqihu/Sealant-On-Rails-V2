Feature: Patient Details Entry Form

    Scenario: User completes form and submits
        Given I am on the Patient Details Form page
        And I enter the Patientid field with 23
        And I enter the Program Name field with "sealant visit"
        And I enter the School Name field with "my school"
        And I enter the Age field with 7
        And I enter the Insurance field with "Blue Cross"
        And I enter the Grade field with "5"
        And I click Create Patient detail
        Then I should see a patient detail validation message

    Scenario: Invalid Age is entered
        Given I am on the Patient Details Form page
        And I enter the Patientid field with 23
        And I enter the Program Name field with "sealant visit"
        And I enter the School Name field with "my school"
        When I enter the Age field with -1
        And I enter the Insurance field with "Blue Cross"
        And I enter the Grade field with "5"
        And I click Create Patient detail
        Then I should see an error message for age
        And the form should not submit

    Scenario: School name is not entered
        Given I am on the Patient Details Form page
        And I enter the Patientid field with 23
        And I enter the Program Name field with "sealant visit"
        When I enter the Age field with 5
        And I enter the Insurance field with "Blue Cross"
        And I enter the Grade field with "5"
        And I click Create Patient detail
        Then I should see an error message for school name
        And the form should not submit

    Scenario: Age is not entered
        Given I am on the Patient Details Form page
        And I enter the Patientid field with 23
        And I enter the Program Name field with "sealant visit"
        And I enter the School Name field with "my school"
        And I enter the Insurance field with "Blue Cross"
        And I enter the Grade field with "5"
        And I click Create Patient detail
        Then I should see an error message for age
        And the form should not submit

    Scenario: Insurance is not entered
        Given I am on the Patient Details Form page
        And I enter the Patientid field with 23
        And I enter the Program Name field with "sealant visit"
        And I enter the School Name field with "my school"
        When I enter the Age field with 5
        And I enter the Grade field with "5"
        And I click Create Patient detail
        Then I should see an error message for insurance
        And the form should not submit


    Scenario: Grade is not entered
        Given I am on the Patient Details Form page
        And I enter the Patientid field with 23
        And I enter the Program Name field with "sealant visit"
        And I enter the School Name field with "my school"
        When I enter the Age field with 5
        And I enter the Insurance field with "Blue Cross"
        And I click Create Patient detail
        Then I should see an error message for grade
        And the form should not submit

