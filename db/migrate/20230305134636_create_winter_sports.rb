class CreateWinterSports < ActiveRecord::Migration[7.0]
  def change
    create_table :winter_sports do |t|
      t.string :name
      t.integer :time
      t.float :distance
      t.float :avg_speed
      t.float :max_speed
      t.integer :avg_heart_rate
      t.integer :max_heart_rate
      t.integer :max_elevation
      t.integer :elevation_gain
      t.string :friends, default: " "
      t.date :date
      t.references :activity_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
