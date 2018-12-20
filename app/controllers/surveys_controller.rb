class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :edit, :update, :destroy]

  # GET /surveys
  # GET /surveys.json
  def index
    @surveys = Survey.all
  end

  # GET /surveys/1
  # GET /surveys/1.json
  def show
    @survey = Survey.find(params[:id])
    @sub_surveys = @survey.sub_surveys
  end

  # GET /surveys/new
  def new
    @survey = Survey.new
    @patients = Patient.all
    @question = Question.new
    @questions = Question.all
    @dummy = DummySurvey.new
  end

  # GET /surveys/1/edit
  def edit
  end

  # POST /surveys
  # POST /surveys.json
  def create
    @survey = Survey.new(survey_params)

    patientArray = params[:survey][:patient_ids]
    #patientArray = survey_params[:patient_ids]
    patientCount = patientArray.length


    @dummy = DummySurvey.last
    @survey.name = @dummy.name
    @survey.description = @dummy.description
    @survey.start_date = @dummy.start_date
    @survey.end_date = @dummy.end_date

    n = @dummy.frequency
    d = @dummy.interval

    @survey.frequency = n
    @survey.interval = d

    (0..(n-1)).each do |i|
      @sub_survey = @survey.sub_surveys.build
      @sub_survey.start_date = @survey.start_date + (d * i).days
      @sub_survey.save
    end


    respond_to do |format|
      if @survey.save

        qu_current_questions.each do |q|
          @survey.survey_questions.create(question_id:q)
        end
        refresh_current_questions

        (1..patientCount - 1).each do |i|
          @survey.survey_patients.create(patient_id:patientArray[i])
        end



        format.html { redirect_to @survey, notice: 'Survey was successfully created.' }
        format.json { render :show, status: :created, location: @survey }
      else
        format.html { render :new }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /surveys/1
  # PATCH/PUT /surveys/1.json
  def update
    respond_to do |format|
      if @survey.update(survey_params)
        format.html { redirect_to @survey, notice: 'Survey was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey }
      else
        format.html { render :edit }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.json
  def destroy
    @survey.destroy
    respond_to do |format|
      format.html { redirect_to surveys_url, notice: 'Survey was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_params
      params.require(:survey).permit(:name, :description)
    end
end
