class AddUseIdToMarkers < ActiveRecord::Migration
  def change
    add_column :markers, :user_id, :integer
  end
end
