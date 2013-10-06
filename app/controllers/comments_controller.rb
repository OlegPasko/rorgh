# -*- encoding : utf-8 -*-
class CommentsController < ApplicationController
  
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(params.require(:comment).permit(:body, :parent_id))
    @comment.user = current_user
    @comment.post = Post.find(params[:post_id])
    respond_to do |format|
      if @comment.save
        @comment.post.touch
        format.html { redirect_to post_path(@comment.post), notice: 'Есть' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { redirect_to :back, alert: 'Проверьте сообщение' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
end
