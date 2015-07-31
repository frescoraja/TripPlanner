class TripPlansController < ApplicationController
  before_action :require_login, only: [:new, :create]
  def index
    @trip_plans = TripPlan.all.paginate(page: params[:page], per_page: 9)
  end

  def new
    @trip_plan = TripPlan.new
  end

  def create
    @trip_plan = TripPlan.new(trip_plan_params)
    if @trip_plan.save
      flash[:success] = "Registration Successful!"
      redirect_to root_url
    else
      render :new
    end
  end

  def show
  end

  private
  def trip_plan_params
    params.require(:trip_plan).permit(:title, :picture)
  end
end
