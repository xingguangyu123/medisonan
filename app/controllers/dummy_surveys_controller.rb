class DummySurveysController < ApplicationController
  def create
    @dummy = DummySurvey.new(dummy_survey_params)
    if (@dummy.save)

    end
  end

  def dummy_survey_params
    params.require(:dummy_survey).permit(:name, :description, :frequency, :interval, :start_date, :end_date)
  end
end
