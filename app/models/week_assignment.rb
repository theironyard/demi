class WeekAssignment < ActiveRecord::Base
  belongs_to :week
  belongs_to :assignment
end
