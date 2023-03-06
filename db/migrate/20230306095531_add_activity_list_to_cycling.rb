class AddActivityListToCycling < ActiveRecord::Migration[7.0]
  def change
    add_reference :cyclings, :activity_list, null: false, foreign_key: true
  end
end
