class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user.nil?
      flash[:notice] = "We haveth no known user with that name. Please endeavour once more or createth thine account."
      render :new
    elsif user.authenticate(params[:session][:password])
      flash[:notice].clear if flash[:notice]
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      flash[:notice] = "The password thou hast provided doeth not match. Please endeavour once more or createth thine account."
      render :new
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end
end
