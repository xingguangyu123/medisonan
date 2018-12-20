class QuestionsController < ApplicationController
  protect_from_forgery except: :new

  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def question_list
    @questions_in_current_survey = Question.where(id: $_current_questions)

    render partial: 'questions/question_list'
  end

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json

  def show
    @question = Question.find(params[:id])
  end

  # GET /questions/new
  def new
    @question = Question.new
    @questions = Question.all

    respond_to do |format|
      format.html
      format.js
    end

  end

  # GET /questions/1/edit
  def edit
    @question = Question.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    @questions = Question.all

    respond_to do |format|
      if @question.save
        #shier
        she_current_questions(@question.id)


        format.html
        #format.js {render action: 'show_new_question', status: :created, location:setup_survey_path, layout: false}
        format.js



      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity, location:new_survey_path }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    update_params = question_params

    if !!update_params[:has_date_field] == true
      update_params[:has_date_field] = true
    else
      update_params[:has_date_field] = false
    end

    if !!update_params[:has_comment_field] == true
      update_params[:has_comment_field] = true
    else
      update_params[:has_comment_field] = false
    end

    respond_to do |format|
      if @question.update(update_params)
        format.js
      else
        format.js
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    delete_from_current_questions_by_id params[:id]

    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:questiontype, :description, :has_date_field, :date_field_description, :has_comment_field, :comment_field_description, selections:[], multipleselections:[])
    end
end
