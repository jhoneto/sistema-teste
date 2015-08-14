class Classroom < ActiveRecord::Base
  validates :student_id, presence: true
  validates :course_id, presence: true

  belongs_to :student
  belongs_to :course

  before_create :set_entry_at

  def set_entry_at
    self.entry_at = Time.now
  end
end
