# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = current_user.account.posts.by_recently_created
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user.account

    if @post.save
      flash[:success] = 'Your post has been saved successfully'
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
