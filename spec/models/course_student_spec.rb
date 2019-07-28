require 'rails_helper'

RSpec.describe CourseStudent do
  describe "Relationships" do
    it {should belong_to :course}
    it {should belong_to :student}
  end

  describe "Validations" do
    it { should validate_presence_of :grade}
  end

  describe 'class method' do
    it ".sorted_grades" do
      dance = Course.create!(name: "Vogue Fundamentals")

      tay = Student.create!(name: "Tay James")
      val = Student.create!(name: "Valentino Valentine")
      kevin = Student.create!(name: "Kevin Chavez")

      cs1 = dance.course_students.create!(student_id: val.id, grade: 94.0)
      cs2 = dance.course_students.create!(student_id: kevin.id, grade: 93.1)
      cs3 = dance.course_students.create!(student_id: tay.id, grade: 93.0)
      expect(dance.course_students.sorted_grades).to eq([cs1, cs2, cs3])
    end
  end
end
