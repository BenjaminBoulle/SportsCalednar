class AddActivityListToSwimming < ActiveRecord::Migration[7.0]
  def change
    add_reference :swimmings, :activity_list, null: false, foreign_key: true
  end
end
