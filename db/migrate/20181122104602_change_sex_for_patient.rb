class ChangeSexForPatient < ActiveRecord::Migration[5.2]
  def change
    change_column :patients, :sex, :text
  end
end
