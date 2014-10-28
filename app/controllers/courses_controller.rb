class CoursesController < ApiController
  before_action :find_course, only: [:show, :update, :destroy]

  def object; @course; end

  def index
    authorize! :read, Course
    @courses = Course.all
  end

  def create
    @course = Course.new create_params
    super
  end

private

  def find_course
    @course = Course.find params[:id]
  end

  def create_params
    params.require(:course).permit(:name)
  end
end
