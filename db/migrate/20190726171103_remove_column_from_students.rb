class RemoveColumnFromStudents < ActiveRecord::Migration[5.1]
  def change
    remove_column :students, :grade, :float
  end
end
