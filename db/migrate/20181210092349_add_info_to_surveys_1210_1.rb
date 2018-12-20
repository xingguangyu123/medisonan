class AddInfoToSurveys12101 < ActiveRecord::Migration[5.2]
  def change
    add_column :surveys, :frequency, :integer
    add_column :surveys, :interval, :integer
    add_column :dummy_surveys, :frequency, :integer
    add_column :dummy_surveys, :interval, :integer
  end
end
