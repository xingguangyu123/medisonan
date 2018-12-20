class AddIndexToSurveyPatients < ActiveRecord::Migration[5.2]
  def change
    add_index :survey_patients,:survey_id
    add_index :survey_patients,:patient_id
    add_index :survey_patients,[:survey_id,:patient_id], unique: true
    add_index :survey_patients,:hasdone
  end
end
