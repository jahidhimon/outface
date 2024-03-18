# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :author, class_name: 'Account', foreign_key: 'account_id'
  scope :by_recently_created, -> { order(created_at: :desc) }
  has_many :loves, dependent: :destroy, class_name: 'Love'

  has_many :comments, dependent: :destroy

  validates :body, presence: true
end
