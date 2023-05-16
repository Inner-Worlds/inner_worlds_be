# frozen_string_literal: true

class CreateDreamTags < ActiveRecord::Migration[7.0]
  def change
    create_table :dream_tags do |t|
      t.references :dream, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
