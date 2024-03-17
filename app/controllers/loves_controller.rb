# frozen_string_literal: true

class LovesController < ApplicationController
  before_action :find_post
  before_action :find_love

  def create
    if @current_love.exists?
      @current_love.first.destroy
    else
      @post.loves.create(account: current_user.account)
    end
    redirect_to post_loves_path(@post)
  end

  def index
    @loves = @post.loves.includes(:account)
    @love_count = @loves.count
    @already_loved = @current_love.exists?
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_love
    @current_love = Love.where(account_id: current_user.account.id, post_id: params[:post_id]).limit(1)
  end
end
