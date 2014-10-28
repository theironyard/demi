class WeeksController < ApiController
  def show
    @course   = Course.where(name: params[:course]).first!
    @timeline = @course.timelines.where(name: params[:timeline]).first!
    @week     = @timeline.weeks.where(number: params[:week]).first!

    authorize! :read, @week
  end
end
