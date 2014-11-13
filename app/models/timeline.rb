class Timeline < ActiveRecord::Base
  belongs_to :course
  has_many :weeks

  validates :name, presence: true, uniqueness: true

  before_create { self.slug = self.name.downcase.gsub /\s+/, '-' }

  def ensure_weeks!
    1.upto(12) { |n| weeks.where(number: n).first_or_create! }
  end
end
