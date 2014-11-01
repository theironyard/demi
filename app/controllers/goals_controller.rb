class GoalsController < ApiController
  resource Goal, params: [:description]
end
