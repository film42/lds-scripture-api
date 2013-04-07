class CreateVerses < ActiveRecord::Migration
  def change
    create_table :verses do |t|

      # Defaults
      t.integer :volume_id
      t.integer :book_id
      t.integer :chapter
      t.integer :verses
      t.integer :pilcrow
      t.text    :verse_scripture
      t.string  :verse_title
      t.string  :verse_title_short

      t.timestamps
    end
    add_index :verses, :volume_id
    add_index :verses, :book_id

  end
end
