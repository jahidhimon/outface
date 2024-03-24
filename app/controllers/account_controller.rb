# frozen_string_literal: true

class AccountController < ApplicationController
  helper_method :current_user_follows?
  def profile
    @account = Account.find(params[:id])
    @already_followed = current_user_follows?(@account)
    @posts = @account.posts
  end

  def dashboard; end

  def index
    @accounts = Account.all.includes(:user)
  end

  def settings
    @account = current_user.account
  end

  def update
    @account = current_user.account
    if @account.update account_params
      flash[:success] = 'Settings saved successfully'
      redirect_to profile_path(@account)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def current_user_follows?(account)
    Follow.exists?(follower_id: current_user.account.id, followee_id: account.id)
  end

  def account_params
    params.require(:account).permit(:avatar, :first_name, :last_name, :designation, :company, :address, :about)
  end
end
