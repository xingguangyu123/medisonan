class Survey < ApplicationRecord
  has_many :survey_patients
  has_many :patients, through:  :survey_patients
  has_many :survey_questions,dependent: :destroy
  has_many :questions, through: :survey_questions,dependent: :destroy

  has_many :sub_surveys
end