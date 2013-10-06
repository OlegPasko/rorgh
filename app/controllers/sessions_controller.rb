# coding: utf-8
class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by_email(params[:email].downcase)
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Привет, #{current_user.name}"
    else
      flash.now.alert = "Email или пароль неверны"
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Пока!"
  end
end