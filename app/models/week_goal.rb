class WeekGoal < ActiveRecord::Base
  belongs_to :week
  belongs_to :goal
end
