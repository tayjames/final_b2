class RemoveColumnFromCourses < ActiveRecord::Migration[5.1]
  def change
    remove_column :courses, :grade, :float
  end
end
