class TimelinesController < ApiController
  resource Timeline, params: [:name]

  def scope
    course.timelines
  end

  def create
    super
    @timeline.ensure_weeks!
  end

private

  def course
    @_course ||= Course.find params[:course_id]
  end
end
