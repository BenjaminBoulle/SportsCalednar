class AddElevationGainToRunning < ActiveRecord::Migration[7.0]
  def change
    add_column :runnings, :elevation_gain, :integer
  end
end
