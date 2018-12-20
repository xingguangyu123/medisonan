class AddPatientInfo2ToPatients < ActiveRecord::Migration[5.2]
  def change
    add_column :patients, :currentSick, :text
  end
end
