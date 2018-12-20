class CreateSurveys < ActiveRecord::Migration[5.2]
  def change
    create_table :surveys do |t|
      t.string :name
      t.string :description
      t.string :state

      t.timestamps
    end
  end
end
