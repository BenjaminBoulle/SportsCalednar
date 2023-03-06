class AddActivityListToWalking < ActiveRecord::Migration[7.0]
  def change
    add_reference :walkings, :activity_list, null: false, foreign_key: true
  end
end
