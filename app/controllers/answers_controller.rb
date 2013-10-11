# coding: utf-8
class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]
  before_action :check_user, only: [:index]
  
  def index
    @answers = Answer.all
  end
  
  def new
    @post = Post.find(params[:post_id])
    @answer = Answer.new
  end
  
  def edit
    @post = @answer.post
  end
  
  def create
    @answer = Answer.new(answer_params)
    @answer.user = current_user
    @answer.post = Post.find(params[:post_id])
    respond_to do |format|
      if @answer.save
        format.html { redirect_to post_path(@answer.post), notice: 'Принято' }
        format.json { render json: @answer, status: :created, location: @answer }
      else
        format.html { redirect_to :back, alert: 'Ошибка' }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    if @answer.update(answer_params)
      @answer.update_attributes(status: 'new') if @answer.user == current_user and !current_user.admin
      redirect_to @answer.post, notice: 'Ответ обновлен'
    else
      redirect_to @answer.post, alert: 'Ошибка'
    end
  end
  
  private
  
  def set_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:link, :comment, :status, :correction_comment)
  end
  
  def check_user
    redirect_to posts_url, notice: 'Нельзя :)' if !current_user.admin
  end
end
