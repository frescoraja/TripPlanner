class TripPlansController < ApplicationController
  before_action :require_login, only: [:new, :create]
  def index
    @trip_plans = TripPlan.all.paginate(page: params[:page], per_page: 9)
  end

  def create
    @trip_plan = current_user.trip_plans.new(trip_plan_params)
    @trip_plan.save
    expire_fragment('total_trip_plans')
    redirect_to request.referrer
  end

  def new
    @trip_plan = current_user.trip_plans.new
  end

  private
  def trip_plan_params
    params.require(:trip_plan).permit(:title, :picture)
  end
end
