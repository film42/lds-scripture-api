class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|

      # Defaults
      t.string  :book_subtitle
      t.string  :book_title
      t.string  :book_title_jst
      t.string  :book_title_long
      t.string  :book_title_short
      t.string  :lds_org
      t.integer :num_chapters
      t.integer :num_verses
      t.integer :volume_id

      t.timestamps
    end
    add_index :books, :volume_id

  end
end
