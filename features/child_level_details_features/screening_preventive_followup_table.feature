Feature: Using the Screening, Preventive, and Follow Up Services Table

    Scenario: Filling Out The Table
        Given I am on the Patient Details Form page
        And I enter the Patientid field with 23
        And I enter the Program Name field with "sealant visit"
        And I enter the School Name field with "my school"
        And I enter the Age field with 7
        And I enter the Insurance field with "Blue Cross"
        And I enter the Grade field with "5"
        And I enter the date with "04/04/2023"
        And I click the "Create Patient detail" button
        And I visit this patient's child level details forms
        

        #fill out Table
        #check that values are saved after submission

    Scenario: Values inputted to the table are automatically counted

    Scenario: Filling out the Preventive and Follow Up Forms

    
