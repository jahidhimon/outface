# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :find_post

  def index
    @comments = @post.comments
  end

  def create
    @comment = @post.comments.new(comment_params)
    @comment.author = current_user.account

    flash.now[:success] = 'Comment created' if @comment.save

    respond_to do |format|
      format.html { redirect_to post_path(@post) }
      format.turbo_stream
    end
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
