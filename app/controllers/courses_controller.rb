class CoursesController < ApiController
  before_action :find_course, only: [:show, :update, :destroy]

  def index
    authorize! :read, Course
    @courses = Course.all
  end

  def show
    authorize! :read, @course
  end

  def create
    @course = Course.new create_params
    authorize! :create, @course
    @course.save!
    render :show
  end

  def update
    authorize! :update, @course
    @course.update_attributes! update_params
    render :show
  end

  def destroy
    authorize! :delete, @course
    @course.destroy
    render :show
  end

private

  def find_course
    @course = Course.find params[:id]
  end

  def create_params
    params.require(:course).permit(:name)
  end
end
