class CreateVolumes < ActiveRecord::Migration
  def change
    create_table :volumes do |t|

      # Defaults
      t.string  :volume_title
      t.string  :volume_title_long
      t.string  :volume_subtitle
      t.string  :lds_org
      t.integer :num_books
      t.integer :num_chapters
      t.integer :num_verses
      t.integer :volume_id

      t.timestamps
    end
    add_index :volumes, :volume_id
  
  end
end
