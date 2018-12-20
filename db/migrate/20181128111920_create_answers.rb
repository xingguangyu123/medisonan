class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.integer :question_type
      t.integer :question_id
      t.integer :patient_id
      t.string :answer_single
      t.boolean :answer_judge
      t.text :subjective_description

      t.timestamps
    end
  end
end
