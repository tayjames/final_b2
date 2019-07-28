require "rails_helper"
# User Story 2, Course Index Page
# As a user,
# When I visit a course index page,
# Then I see each course in the system including:
# - the course's name
# - each student in the course listed in order from highest grade to lowest grade
RSpec.describe "Course Index Page" do
  describe "As a user" do
    before :each do
      @math = Course.create!(name: "Abstract Algebra")
      @spanish = Course.create!(name: "Advanced Spanish Grammar")
      @dance = Course.create!(name: "Vogue Fundamentals")

      @tay = Student.create!(name: "Tay James")
      @val = Student.create!(name: "Valentino Valentine")
      @kevin = Student.create!(name: "Kevin Chavez")

      @math.course_students.create!(student_id: @kevin.id, grade: 96.0)
      @math.course_students.create!(student_id: @tay.id, grade: 95.0)
      @spanish.course_students.create!(student_id: @kevin.id, grade: 96.0)
      @spanish.course_students.create!(student_id: @val.id, grade: 94.0)
      @dance.course_students.create!(student_id: @val.id, grade: 94.0)
      @dance.course_students.create!(student_id: @kevin.id, grade: 93.1)
      @dance.course_students.create!(student_id: @tay.id, grade: 93.0)
      binding.pry
    end

    it "When I visit a course index page I see each course in the system including:
        the course name, each student in course (highest/lowest grade)" do

      visit courses_path
      save_and_open_page
      within "#course-#{@math.id}" do
        expect(page).to have_content(@math.name)
        expect(page).to have_content(@kevin.name)
        expect(page).to have_content(@tay.name)

        expect(page).to have_content(@math.grade(@kevin))
        expect(page).to have_content(@math.grade(@tay))
      end

      within "#course-#{@spanish.id}" do
        expect(page).to have_content(@spanish.name)
        expect(page).to have_content(@kevin.name)
        expect(page).to have_content(@val.name)

        expect(page).to have_content(@spanish.grade(@kevin))
        expect(page).to have_content(@spanish.grade(@val))
      end

      within "#course-#{@dance.id}" do
        expect(page).to have_content(@dance.name)
        expect(page).to have_content(@val.name)
        expect(page).to have_content(@kevin.name)
        expect(page).to have_content(@tay.name)

        expect(page).to have_content(@dance.grade(@val))
        expect(page).to have_content(@dance.grade(@kevin))
        expect(page).to have_content(@dance.grade(@tay))
      end
    end
  end
end
