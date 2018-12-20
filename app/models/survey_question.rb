class SurveyQuestion < ApplicationRecord
  belongs_to :survey
  belongs_to :question
  validates :survey_id , presence: true
  validates :question_id , presence: true
end
