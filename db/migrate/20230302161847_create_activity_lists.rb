class CreateActivityLists < ActiveRecord::Migration[7.0]
  def change
    create_table :activity_lists do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
