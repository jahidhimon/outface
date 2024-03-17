# frozen_string_literal: true

class CreateLoves < ActiveRecord::Migration[7.1]
  def change
    create_table :loves do |t|
      t.references :post, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
