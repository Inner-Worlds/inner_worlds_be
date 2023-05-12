class CreateDreamEmotions < ActiveRecord::Migration[7.0]
  def change
    create_table :dream_emotions do |t|
      t.references :emotion, null: false, foreign_key: true
      t.references :dream, null: false, foreign_key: true

      t.timestamps
    end
  end
end
