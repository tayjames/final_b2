require 'rails_helper'

RSpec.describe "Student Show Page" do
  describe "As a user" do

    before :each do
      @math = Course.create!(name: "Abstract Algebra")
      @spanish = Course.create!(name: "Advanced Spanish Grammar")
      @dance = Course.create!(name: "Vogue Fundamentals")

      @tay = Student.create!(name: "Tay James")
      @kevin = Student.create!(name: "Kevin DC")
      @valentino = Student.create!(name: "Valentino Valentine")

      @math.course_students.create!(student_id: @tay.id, grade: 95.0)
      @spanish.course_students.create!(student_id: @kevin.id, grade: 100.0)
      @dance.course_students.create!(student_id: @valentino.id, grade: 95.0)
      @dance.course_students.create!(student_id: @kevin.id, grade: 90.0)
      @dance.course_students.create!(student_id: @tay.id, grade: 85.0)
      # binding.pry
    end

    it "When I visit a student show page then I see the student's name,
    name of each course student is enrolled in, and grade for each course" do
      visit student_path(@tay)
      save_and_open_page
      expect(page).to have_content(@tay.name)
      expect(page).to have_content(@math.name)
      expect(page).to have_content(@dance.name)

      expect(page).to have_content(@math.grade(@tay))
      expect(page).to have_content(@dance.grade(@tay))
    end
  end
end
