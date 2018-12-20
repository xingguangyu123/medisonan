class AddColumnToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :multipleselections,  :text ,array: true , default: []
  end
end
