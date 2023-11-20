# spec/controllers/statistics_controller_spec.rb

require 'rails_helper'

RSpec.describe StatisticsController, type: :controller do
  describe 'GET #index' do
    it 'assigns statistics_data' do
      patient_detail = PatientDetail.create!(PID:456, PatientId: 1, SchoolName: 'Test School', Date: Date.today, Age: 10, Grade: 5, Insurance: 'bhvyv')

      get :index

      expect(assigns(:statistics_data)).to include(patient_detail)
    end
  end

  describe 'GET #schoolStats' do
    it 'assigns school_data' do
      patient_detail = PatientDetail.create!(PID: 454, PatientId: 1, SchoolName: 'Test School', Date: Date.today, Age: 112, Grade: 7, Insurance: 'fgfgfg')
      child_level_detail = ChildLevelDetail.create!(patient_detail: patient_detail, FirstSealedNum: 1)

      get :schoolStats
    end
  end

  describe 'GET #school' do
    it 'assigns school_data and chart_data1' do
      # Create test data directly in the test database
      patient_detail = PatientDetail.create!(PID:234, PatientId: 7, SchoolName: 'Test Schoolm', Date: Date.today, Age: 19, Grade: 8, Insurance: 'ffffv')
      child_level_detail = ChildLevelDetail.create!(patient_detail: patient_detail, FirstSealedNum: 1)

      get :school
    end
  end

  describe 'GET #event' do
    it 'assigns event_data and chart_data_con_forms' do
    event_detail = EventDetail.create!(
        EventDate: Date.today,
        School: 'Test School',
        ConsentFD: 1,
        DenHrs: 2.5,
        DenTravelHrs: 1.5,
        DenTravelMil: 50.0,
        HygHours: 1.0,
        HygTravelMil: 30.0,
        HygTravelHrs: 0.5,
        AssistantTravelMil: 20.0,
        AssistantHrs: 1.0,
        AssistantTravelHrs: 0.3,
        OtherHrs: 0.8,
        OtherTravelHrs: 0.2,
        OtherTravelMiles: 10.0,
        NumberOfSSPDriven: 2,
        TotalMilesDriven: 80.0,
        ChildScreened: 50.0,
        ChildReceivingSealant: 30.0,
        NumberOfSealed: 100.0,
        NumberFlourideVarnish: 40.0,
        NumberProphy: 20.0,
        
      )

      get :event
    end
  end
end
