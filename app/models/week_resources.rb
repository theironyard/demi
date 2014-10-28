class WeekResource < ActiveRecord::Base
  belongs_to :week
  belongs_to :resource
end
