class AssignmentsController < ApiController
  before_action :find_assignment

  def object; @assignment; end

private

  def find_assignment
    @assignment = Assignment.find params[:id]
  end

  def create_params
    params.require(:assignment).permit :description
  end
end
