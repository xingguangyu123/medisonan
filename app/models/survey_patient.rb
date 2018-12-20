class SurveyPatient < ApplicationRecord
  belongs_to :survey
  belongs_to :patient

end
