require "rails_helper"

RSpec.describe Course do
  describe "Relationships" do
    it { should have_many :course_students}
    it { should have_many(:students).through(:course_students)}
  end

  describe "Validations" do
    it { should validate_presence_of :name}
  end

  describe "Instance Methods" do
    it '.grade(student)' do
      tay = Student.create!(name: "Tay James")
      math = Course.create!(name: "Calculus")
      math.course_students.create!(student_id: tay.id, grade: 75.0)

      expect(math.grade(tay)).to eq(75.0)
    end
  end
end
