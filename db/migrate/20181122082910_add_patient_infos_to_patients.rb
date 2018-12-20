class AddPatientInfosToPatients < ActiveRecord::Migration[5.2]
  def change
    add_column :patients, :medical_history, :text
    add_column :patients, :education_level, :string
    add_column :patients, :Smoking, :bool
    add_column :patients, :father_age, :string
    add_column :patients, :father_sick_history, :string
    add_column :patients, :mother_age, :string
    add_column :patients, :mother_sick_history, :string
  end
end
