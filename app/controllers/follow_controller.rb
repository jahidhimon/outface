# frozen_string_literal: true

class FollowController < ApplicationController
  def create
    @account = Account.find(params[:id])
    Follow.create(follower_id: current_user.account.id, followee_id: @account.id)
    redirect_back fallback_location: profile_path(@account)
  end

  def destroy
    @account = Account.find(params[:id])
    Follow.where(follower_id: current_user.account.id, followee_id: @account.id).limit(1).first.destroy
    redirect_back fallback_location: profile_path(@account)
  end
  def index
    @account = Account.find(params[:id])
    @followers = Follow.where(followee_id: params[:id])
  end
end
