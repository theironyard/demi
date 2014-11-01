class GoalsController < ApiController
  before_action :find_goal

  def object; @goal; end

private

  def find_goal
    @goal = Goal.find params[:id]
  end

  def create_params
    params.require(:goal).permit :description
  end
end
