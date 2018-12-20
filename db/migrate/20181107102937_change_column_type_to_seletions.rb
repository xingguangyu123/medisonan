class ChangeColumnTypeToSeletions < ActiveRecord::Migration[5.2]
  def change
    change_column :questions, :selections, :text ,array: true , default: []
  end
end
