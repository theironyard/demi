class CoursesController < ApiController
  resource Course, params: [:name]
end
