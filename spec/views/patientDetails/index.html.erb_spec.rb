require 'rails_helper'

RSpec.describe "patient_details/index", type: :view do
  before(:each) do
    assign(:patient_details, [
      PatientDetail.create!(
        ProgramName: "Program Name",
        SchoolName: "School Name",
        Age: 2,
        Insurance: "Insurance",
        Grade: "Grade",
        PID: "PID", 
        PatientId: 1
    ),
    PatientDetail.create!(
      ProgramName: "Program Name",
      SchoolName: "School Name",
      Age: 2,
      Insurance: "Insurance",
      Grade: "Grade",
      PID: "PID", 
      PatientId: 1
  )
    ])
  end

  it "renders a list of patient_detail" do
    render
    # cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select 'tr>td', text: Regexp.new("Program Name".to_s), count: 2
    assert_select 'tr>td', text: Regexp.new("School Name".to_s), count: 2
  end
end
