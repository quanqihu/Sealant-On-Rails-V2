Feature: Display Table of Patients
    
    Scenario: Going to Patient Details Form
        Given I am on the Patient Display page
        When I click the New Patient Details button
        Then I should be taken to the patient details form
    
    Scenario: Display created entry 
        Given I am on the Patient Details Form page
        And I enter the Patientid field with 23
        And I enter the Program Name field with "sealant visit"
        And I enter the School Name field with "my school"
        And I enter the Age field with 7
        And I enter the Insurance field with "Blue Cross"
        And I enter the Grade field with "5"
        And I enter the date with "04/04/2023"
        And I click Create Patient detail
        When I go to the patient display page
        Then I should see an entry with Patientid 23
        And its school name should be "my school"

    

    Scenario: Editing a Patient's Details
        Given I am on the Patient Details Form page
        And I enter the Patientid field with 23
        And I enter the Program Name field with "sealant visit"
        And I enter the School Name field with "my school"
        And I enter the Age field with 7
        And I enter the Insurance field with "Blue Cross"
        And I enter the Grade field with "5"
        And I enter the date with "04/04/2023"
        And I click Create Patient detail
        When I go to the patient display page
        When I click Show This Patient's Details
        And I click Edit this patients details
        And I change the Age to 8
        And I click Update Patient detail
        Then I should see a message confirming the update
        And the patient's age should be 8

    Scenario: Deleting a Patient's details
        Given I am on the Patient Details Form page
        And I enter the Patientid field with 23
        And I enter the Program Name field with "sealant visit"
        And I enter the School Name field with "my school"
        And I enter the Age field with 7
        And I enter the Insurance field with "Blue Cross"
        And I enter the Grade field with "5"
        And I enter the date with "04/04/2023"
        And I click Create Patient detail
        When I go to the patient display page
        Given I am on the Patient Display page
        When I click Show This Patient's Details
        And I click on Destroy this patient detail
        Then I should see a message confirming the deletion
         

