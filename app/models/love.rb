# frozen_string_literal: true

class Love < ApplicationRecord
  belongs_to :post
  belongs_to :account
end
