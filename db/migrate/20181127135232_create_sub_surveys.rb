class CreateSubSurveys < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_surveys do |t|
      t.date :start_date
      t.date :end_date
      t.references :survey, foreign_key:true

      t.timestamps
    end
  end
end
