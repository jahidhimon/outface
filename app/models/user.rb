# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :account, dependent: :destroy

  after_create :create_user_account

  private

  def create_user_account
    build_account.save(validate: false)
    Follow.create(follower_id: account.id, followee_id: account.id)
  end
end
