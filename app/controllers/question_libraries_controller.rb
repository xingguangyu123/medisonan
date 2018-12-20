class QuestionLibrariesController < ApplicationController
  before_action :set_question_library, only: [:show, :edit, :update, :destroy]

  def show_list_for_survey
    @question_libraries = QuestionLibrary.all

    respond_to do |format|
      format.js
    end
  end

  def choose_question
    @ql = QuestionLibrary.find(params[:selectedQuestion])
    @question = Question.new
    @question.questiontype = @ql.questiontype
    @question.description = @ql.description
    @question.selections = @ql.selections
    @question.multipleselections = @ql.multipleselections
    @question.has_date_field = @ql.has_date_field
    @question.date_field_description = @ql.date_field_description
    @question.has_comment_field = @ql.has_comment_field
    @question.comment_field_description = @ql.comment_field_description

    if @question.save
      she_current_questions(@question.id)
    end
  end

  def question_library_list
    @question_libraries = QuestionLibrary.all

    render partial: 'question_libraries/question_list'
  end

  # GET /question_libraries
  # GET /question_libraries.json
  def index
    @question_libraries = QuestionLibrary.all
  end

  # GET /question_libraries/1
  # GET /question_libraries/1.json
  def show
  end

  # GET /question_libraries/new
  def new
    @question_library = QuestionLibrary.new

    respond_to do |format|
      format.js
    end
  end

  def new_multiple
    @question_library = QuestionLibrary.new

    respond_to do |format|
      format.js
    end
  end

  # GET /question_libraries/1/edit
  def edit
  end

  # POST /question_libraries
  # POST /question_libraries.json
  def create
    @question_library = QuestionLibrary.new(question_library_params)

    respond_to do |format|
      if @question_library.save
        format.js
        format.json { render :show, status: :created, location: @question_library }
      else
        format.json { render json: @question_library.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /question_libraries/1
  # PATCH/PUT /question_libraries/1.json
  def update
    respond_to do |format|
      if @question_library.update(question_library_params)
        format.html { redirect_to @question_library, notice: 'Question library was successfully updated.' }
        format.json { render :show, status: :ok, location: @question_library }
      else
        format.html { render :edit }
        format.json { render json: @question_library.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /question_libraries/1
  # DELETE /question_libraries/1.json
  def destroy
    @question_library.destroy
    respond_to do |format|
      format.html { redirect_to question_libraries_url, notice: 'Question library was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question_library
      @question_library = QuestionLibrary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_library_params
      #params.fetch(:question_library, {})
      params.require(:question_library).permit(:questiontype, :description, :has_date_field, :date_field_description, :has_comment_field, :comment_field_description, selections:[], multipleselections:[])
    end
end
