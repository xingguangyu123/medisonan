class BackSexForPatient < ActiveRecord::Migration[5.2]
  def change
    change_column :patients, :sex, :string
  end
end
