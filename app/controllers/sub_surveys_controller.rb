require 'twilio-ruby'
class SubSurveysController < ApplicationController
  skip_before_action :verify_authenticity_token
  def show
    @sub = SubSurvey.find(params[:id])
    @survey = @sub.survey
    @patients = @survey.patients
    session[:current_sub_survey] = params[:id]
  end

  def new_answer


    session[:current_patient_id] = params[:patient]
    @sub = SubSurvey.find(session[:current_sub_survey])

    respond_to do |format|
      format.js
    end
  end

  def create_answers
    @sub = SubSurvey.find(session[:current_sub_survey])
    current_patient_id = session[:current_patient_id]
    params[:answers].each do |key, value|
      @answer = @sub.answers.build
      @answer.patient_id = current_patient_id
      @answer.question_id = key
      if value.keys.first == "single_selection"
        @answer.question_type = 1
        @answer.answer_single = value[:single_selection]
        @answer.subjective_description = value[:description]
      elsif value.keys.first == "multiple_selection"
        @answer.question_type = 2
        multiple_array = Array.new
        value[:multiple_selection].keys.each do |key|
          if key !=  "description"
            multiple_array.push key
          else
            @answer.subjective_description = value[:multiple_selection][:description]
          end
        end
        @answer.answer_multiple = multiple_array
      end
      @answer.date_answer = value[:date_answer]

      @answer.save
    end

    respond_to do |format|
      format.js
    end
  end

  def index
    @sub_surveys = SubSurvey.all
  end

end
