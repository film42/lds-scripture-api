class FixPrimaryKeys < ActiveRecord::Migration
  def up
    add_index :verses, :volume_id
    add_index :verses, :book_id
    add_index :verses, :id

    add_index :books, :volume_id
    add_index :books, :id

    add_index :volumes, :id
  end

  def down
  end
end
