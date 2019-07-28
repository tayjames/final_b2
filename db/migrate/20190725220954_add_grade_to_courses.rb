class AddGradeToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :grade, :float
  end
end
