# coding: utf-8
class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize
  before_action :check_user, only: [:edit, :update, :destroy]
  # GET /posts
  def index
    @posts = Post.all
  end

  # GET /posts/1
  def show
    @answer = Answer.new
    @comment = Comment.new
    @comments = @post.comments.roots
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to @post, notice: 'Тема создана.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Тема обновлена.'
    else
      render action: 'edit'
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Тема удалена.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:name, :body, :task)
    end
    
    def check_user
      redirect_to posts_url, notice: 'Нельзя :)' if @post.user != current_user and !current_user.admin
    end
end
