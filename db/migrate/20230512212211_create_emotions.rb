class CreateEmotions < ActiveRecord::Migration[7.0]
  def change
    create_table :emotions do |t|
      t.string :name

      t.timestamps
    end
  end
end
