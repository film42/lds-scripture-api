class RemoveVolumeIdFromVolumes < ActiveRecord::Migration
  def up
    remove_column :volumes, :volume_id
  end

  def down
  end
end
