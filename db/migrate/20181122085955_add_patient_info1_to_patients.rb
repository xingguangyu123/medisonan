class AddPatientInfo1ToPatients < ActiveRecord::Migration[5.2]
  def change
    add_column :patients, :age, :integer
    add_column :patients, :cellPhoneType, :string
    add_column :patients, :acceptSurvey, :bool
    add_column :patients, :surveyType, :integer
    add_column :patients, :smokeType, :integer
    add_column :patients, :smokeAmount, :integer
    add_column :patients, :smokeHistory, :integer
    add_column :patients, :alcoholType, :integer
    add_column :patients, :alcoholAmount, :integer
  end
end
