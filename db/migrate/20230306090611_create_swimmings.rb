class CreateSwimmings < ActiveRecord::Migration[7.0]
  def change
    create_table :swimmings do |t|
      t.string :name
      t.integer :time
      t.float :distance
      t.float :avg_speed
      t.integer :avg_pace
      t.float :max_speed
      t.integer :avg_heart_rate
      t.integer :max_heart_rate
      t.integer :total_strokes
      t.string :friends
      t.date :date

      t.timestamps
    end
  end
end
