class TimelinesController < ApiController
  before_action :find_timeline, only: [:show, :update, :destroy]

  def index
    authorize! :read, course
    @timelines = course.timelines.all
  end

  def show
    authorize! :read, @timeline
  end

  def create
    @timeline = Timeline.new create_params
    authorize! :create, @timeline
    @timeline.save!
    @timeline.ensure_weeks!
    render :show
  end

  def update
    authorize! :update, @timeline
    @timeline.update_attributes! update_params
    render :show
  end

  def destroy
    authorize! :delete, @timeline
    @timeline.destroy
    render :show
  end

private

  def course
    @_course ||= Course.find params[:course_id]
  end

  def find_timeline
    @timeline = Timeline.find params[:id]
  end

  def create_params
    params.require(:timeline).permit(:name)
  end
end
