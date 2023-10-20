require 'rails_helper'

RSpec.describe "patient_details/show", type: :view do
  before(:each) do
    assign(:patient_detail, PatientDetail.create!(
      ProgramName: "Program Name",
      SchoolName: "School Name",
      Age: 2,
      Insurance: "Insurance",
      Grade: "Grade",
      PID: "PID", 
      PatientId: 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to have_button("Destroy this patients detail")
  end
end
