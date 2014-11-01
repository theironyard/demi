class WeeksController < ApiController
  before_action :find_week

  def show
    authorize! :read, @week
  end

  def assignments
    authorize! :create, Assignment
    @assignment = Assignment.
      where(params.require(:assignment).permit :description).
      first_or_create!
    @week.assignments << @assignment unless @week.assignments.include?(@assignment)
    head :ok
  end

  def goals
    authorize! :create, Goal
    @goal = Goal.
      where(params.require(:goal).permit :description).
      first_or_create!
    @week.goals << @goal unless @week.goals.include?(@goal)
    head :ok
  end

  def resources
    authorize! :create, Resource
    @resource = Resource.
      where(params.require(:resource).permit :description, :url).
      first_or_create!
    @week.resources << @resource unless @week.resources.include?(@resource)
    head :ok
  end

private

  def find_week
    @course   = Course.where(name: params[:course]).first!
    @timeline = @course.timelines.where(name: params[:timeline]).first!
    @week     = @timeline.weeks.where(number: params[:week]).first!
  end
end
