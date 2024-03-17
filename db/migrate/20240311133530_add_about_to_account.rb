# frozen_string_literal: true

class AddAboutToAccount < ActiveRecord::Migration[7.1]
  def change
    add_column :accounts, :about, :text, null: false, default: ''
  end
end
