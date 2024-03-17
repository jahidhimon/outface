# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :author, class_name: 'Account', foreign_key: 'account_id'
  belongs_to :post
end
