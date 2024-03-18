# frozen_string_literal: true

class Account < ApplicationRecord
  belongs_to :user, dependent: :destroy
  validates :first_name, :last_name, :address, :about, :company, presence: true
  has_many :posts

  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_limit: [50, 50]
  end

  has_many :loves, dependent: :destroy, class_name: 'Love'
  has_many :comments
end
