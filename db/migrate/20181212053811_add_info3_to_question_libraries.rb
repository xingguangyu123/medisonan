class AddInfo3ToQuestionLibraries < ActiveRecord::Migration[5.2]
  def change
    remove_column :question_libraries, :questionType
    add_column :question_libraries, :questiontype, :integer
  end
end
