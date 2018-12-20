class Question < ApplicationRecord
  before_save :remove_blank_selections

  has_many :survey_questions,dependent: :destroy
  has_many :surveys ,through:  :survey_questions

  def remove_blank_selections
    selections.reject!(&:blank?)
    multipleselections.reject!(&:blank?)
  end
end