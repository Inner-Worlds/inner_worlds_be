# frozen_string_literal: true

class AddColumnDefaultToTags < ActiveRecord::Migration[7.0]
  def change
    add_column :tags, :default, :boolean, default: false
  end
end
