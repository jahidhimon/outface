# frozen_string_literal: true

class AccountController < ApplicationController
  def profile
    @account = current_user.account
  end

  def dashboard; end

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

  def account_params
    params.require(:account).permit(:avatar, :first_name, :last_name, :designation, :company, :address, :about)
  end
end
