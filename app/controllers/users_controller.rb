# coding: utf-8
class UsersController < ApplicationController
  before_action :admin_area, only: :index

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params.require(:user).permit(:email, :name, :password, :password_confirmation))
    @user.email = params[:user][:email].downcase
    @user.admin = true unless User.any?
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Тадам!"
    else
      respond_to do |format|
        format.html { render action: "new" }
      end
    end
  end

  def index
    @users = User.all
  end
end