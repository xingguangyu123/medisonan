class CreateQuestionLibraries < ActiveRecord::Migration[5.2]
  def change
    create_table :question_libraries do |t|
      t.integer :questionType
      t.text :description
      t.boolean :has_date_field
      t.string :date_field_description
      t.boolean :has_comment_field
      t.string :comment_field_description

      t.timestamps
    end
  end
end
