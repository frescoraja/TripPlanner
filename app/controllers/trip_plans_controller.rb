class TripPlansController < ApplicationController
  before_action :require_login, only: [:new, :create]
  def index
    @trip_plans = TripPlan.all.paginate(page: params[:page], per_page: 9)
  end

  private
  def trip_plan_params
    params.require(:trip_plan).permit(:title, :picture)
  end
end
