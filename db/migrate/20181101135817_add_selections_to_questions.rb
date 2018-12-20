class AddSelectionsToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :selections, :string ,:array => true , :default => '{}'
  end
end
