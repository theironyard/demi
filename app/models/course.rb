class Course < ActiveRecord::Base
  has_many :timelines

  validates :name, presence: true, uniqueness: true

  before_create { self.slug = self.name.downcase.gsub /\s+/, '-' }
end
