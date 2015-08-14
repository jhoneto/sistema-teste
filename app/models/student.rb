class Student < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 45 }
  validates :register_number, presence: true, length: { maximum: 45 }
  validates :status, presence: true

  has_enumeration_for :status, with: StudentStatus

  has_many :classrooms, dependent: :restrict_with_error

end
