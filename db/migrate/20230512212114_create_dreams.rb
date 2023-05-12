class CreateDreams < ActiveRecord::Migration[7.0]
  def change
    create_table :dreams do |t|
      t.references :user, null: false, foreign_key: true
      t.string :description
      t.integer :lucidity
      t.string :title
      t.datetime :dream_date

      t.timestamps
    end
  end
end
