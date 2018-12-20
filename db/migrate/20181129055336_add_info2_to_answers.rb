class AddInfo2ToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :sub_survey_id, :integer ,:foreign_key => true
    add_index :answers, :sub_survey_id
  end
end
