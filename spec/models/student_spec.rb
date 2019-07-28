require "rails_helper"

RSpec.describe Student do
  describe "Relationships" do
    it { should have_many :course_students}
    it { should have_many(:courses).through(:course_students)}
  end

  describe "Validations" do
    it { should validate_presence_of :name}
  end
end
