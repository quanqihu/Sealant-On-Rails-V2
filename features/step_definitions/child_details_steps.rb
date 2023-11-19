Given('I visit the child level details forms for the patient with PID = {string}') do |string|
    visit ("/child_data?patient_detail_id=" + string)
end
  
And('I click the {string} radio button') do |string|
    find("input[name='radio11'][value='D']").click
end
  
Then('I should see {string} cavities') do |string|
    expect(page).to have_content("Untreated Cavities: " + string)
end



And("I click the Close button in the pop-up") do
    #find(:xpath, "//button[@onclick='closePopup('1','popup11')']").click
    find("button[onclick*=\"closePopup('1','popup11')\"]").click

end

And("I click the Submit button") do
    find('#submitButton').click
end