class CreateSurveyPatients < ActiveRecord::Migration[5.2]
  def change
    create_table :survey_patients do |t|
      t.integer :survey_id
      t.integer :patient_id
      t.boolean :hasdone
      t.timestamps


    end
  end
end
