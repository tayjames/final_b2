class CourseStudent < ApplicationRecord
  belongs_to :course
  belongs_to :student

  validates_presence_of :grade

  def self.sorted_grades
    order(grade: :desc)
  end
end
