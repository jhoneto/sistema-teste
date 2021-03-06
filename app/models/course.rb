class Course < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 45 }
  validates :description, presence: true, length: { maximum: 45 }
  validates :status, presence: true
  has_enumeration_for :status, with: CourseStatus
  has_many :classrooms, dependent: :restrict_with_error
end
