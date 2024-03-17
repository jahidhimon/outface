# frozen_string_literal: true

class AddJobInfoToAccount < ActiveRecord::Migration[7.1]
  def change
    add_column :accounts, :company, :string, null: false, default: ''
    add_column :accounts, :designation, :string, null: false, default: ''
  end
end
