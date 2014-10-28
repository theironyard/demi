class Timeline < ActiveRecord::Base
  belongs_to :course
  has_many :weeks

  validates :name, presence: true, uniqueness: true
end
