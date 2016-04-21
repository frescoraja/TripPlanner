class UsersController < ApplicationController
  before_action :require_login, only: [:index, :show]
  def index
    @users = User.all.where.not(id: current_user.id).paginate(page: params[:page], per_page: 20)
    respond_to do |f|
      f.html
      f.json { render json: { users: @users } }
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      expire_fragment('total_user_count')
      flash.now[:success] = "Registration Successful!"
      redirect_to root_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = params[:id].nil? ? current_user : User.find(params[:id])
    @trip_plans = @user.trip_plans.paginate(page: params[:page], per_page: 9)
    respond_to do |f|
      f.html 
      f.json { render json: { user: @user, trip_plans: @trip_plans } }
    end
  end

  private
  def user_params
    params.require(:user).permit(:login, :password, :password_confirmation)
  end
end
