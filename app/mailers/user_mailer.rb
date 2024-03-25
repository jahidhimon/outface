# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def welcome_email
    @user = User.find(params[:user])
    mail(to: @user.email, subject: 'Welcome to my Awesome site')
  end
end
