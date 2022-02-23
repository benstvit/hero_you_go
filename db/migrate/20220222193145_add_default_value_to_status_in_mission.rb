class AddDefaultValueToStatusInMission < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:missions, :status, 'pending')
  end
end
