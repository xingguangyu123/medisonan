class CreateDummySurveys < ActiveRecord::Migration[5.2]
  def change
    create_table :dummy_surveys do |t|
      t.string :name
      t.string :description
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
