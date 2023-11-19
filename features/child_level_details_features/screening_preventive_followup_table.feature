Feature: Using the Screening, Preventive, and Follow Up Services Table

    Scenario: Filling Out The Table
        Given I am on the Patient Details Form page
        And I enter the Patientid field with 23
        And I enter the Program Name field with "sealant visit"
        And I enter the School Name field with "school"
        And I enter the Age field with 7
        And I enter the Insurance field with "Blue Cross"
        And I enter the Grade field with "5"
        And I enter the date with "04/04/2023"
        And I click the "Create Patient detail" button
        And I visit the child level details forms for the patient with PID = "23-school"
        And I click the "Follow Up" button
        And I click the "ScreeningButton1" button
        And I click the "D - Decay" radio button
        And I click the Close button in the pop-up
        And I click the Submit button
        Then I should see "1" cavities

        #fill out Table
        #check that values are saved after submission

    #Scenario: Values inputted to the table are automatically counted
    #untreated - Decay
    #carries experience = filled

    #Scenario: Filling out the Preventive and Follow Up Forms

    
