class Timeline < ActiveRecord::Base
  belongs_to :course
  has_many :weeks

  validates :name, presence: true, uniqueness: true

  def ensure_weeks!
    1.upto(12) { |n| weeks.where(number: n).first_or_create! }
  end
end
