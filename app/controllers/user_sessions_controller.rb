class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      redirect_to root_url
    else
      flash.now[:errors] = @user_session.errors.full_messages
      render :new
    end
  end

  def destroy
    current_user_session.destroy
    redirect_to new_user_session_url
  end
end
