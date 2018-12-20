module QuestionsHelper
  $_current_questions = Array.new
  def she_current_questions(qid)
    $_current_questions.push(qid)
  end

  def qu_current_questions
    $_current_questions
  end

  def refresh_current_questions
    $_current_questions.clear
  end

  def delete_from_current_questions_by_id (qid)
    $_current_questions.delete(qid)
  end

  def now_current_questions
    @now_array = $_current_questions
    Question.where(questiontype: [1, 2])
  end

  def last_question
    Question.last
  end

end
