class AddColumnToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :grade, :float
  end
end
