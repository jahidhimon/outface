# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :find_post

  def index
    @comments = @post.comments
  end

  def create
    @comment = @post.comments.new(comment_params)
    @comment.author = current_user.account
    if @comment.save
      flash[:success] = 'Comment created'
    else
      flash[:error] = 'There was problem with your comment'
    end
    redirect_to post_path(@post)
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
