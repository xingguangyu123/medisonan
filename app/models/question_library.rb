class QuestionLibrary < ApplicationRecord
  before_save :remove_blank_selections

  def remove_blank_selections
    selections.reject!(&:blank?)
    multipleselections.reject!(&:blank?)
  end
end
