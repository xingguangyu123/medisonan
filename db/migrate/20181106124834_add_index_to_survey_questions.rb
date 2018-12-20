class AddIndexToSurveyQuestions < ActiveRecord::Migration[5.2]
  def change
    add_index :survey_questions,:survey_id
    add_index :survey_questions,:question_id
    add_index :survey_questions,[:survey_id,:question_id], unique: true
  end
end
