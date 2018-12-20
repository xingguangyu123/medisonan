class AddInfoToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :answer_multiple, :string ,:array => true , :default => '{}'
  end
end
