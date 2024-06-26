# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.where(account_id: current_user.account.followees).by_recently_created
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user.account

    if @post.save
      flash[:success] = 'Your post has been saved successfully.'
    else
      flash[:alert] = 'Your post has some problems.'
    end
    respond_to do |format|
      format.html { redirect_to root_path }
      format.turbo_stream
    end
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
