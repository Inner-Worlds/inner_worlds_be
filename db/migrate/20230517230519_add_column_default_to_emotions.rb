# frozen_string_literal: true

class AddColumnDefaultToEmotions < ActiveRecord::Migration[7.0]
  def change
    add_column :emotions, :default, :boolean, default: false
  end
end
