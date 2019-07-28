class Course < ApplicationRecord
  has_many :course_students
  has_many :students, through: :course_students

  validates_presence_of :name

  def grade(student)
    course_students.where("#{student.id} = student_id").pluck(:grade).first
  end
end
