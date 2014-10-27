class Course < ActiveRecord::Base
  has_many :timelines

  validates :name, presence: true, uniqueness: true
end
