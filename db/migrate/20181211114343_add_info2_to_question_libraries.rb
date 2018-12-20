class AddInfo2ToQuestionLibraries < ActiveRecord::Migration[5.2]
  def change
    add_column :question_libraries, :multipleselections,  :text ,array: true , default: []
    add_column :question_libraries, :selections,  :text ,array: true , default: []
  end
end
