class AddInfoToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :has_date_field, :boolean
    add_column :questions, :date_field_description, :string
    add_column :questions, :has_comment_field, :boolean
    add_column :questions, :comment_field_description, :string
  end
end
