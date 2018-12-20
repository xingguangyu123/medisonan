class Patient < ApplicationRecord
  has_many :survey_patients
  has_many :surveys , through: :survey_patients

end
