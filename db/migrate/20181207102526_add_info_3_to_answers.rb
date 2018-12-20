class AddInfo3ToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :date_answer, :date
  end
end
