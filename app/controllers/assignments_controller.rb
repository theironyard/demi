class AssignmentsController < ApiController
  resource Assignment, params: [:description]
end
