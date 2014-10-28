class Week < ActiveRecord::Base
  belongs_to :timeline

  %i(goals resources assignments).each do |col|
    has_many :"week_#{col}"
    has_many col, through: :"week_#{col}"
  end

  validates_presence_of :timeline, :number
  validates_numericality_of :number
end
