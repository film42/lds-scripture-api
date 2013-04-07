class Book < ActiveRecord::Base
  set_primary_key "id"
  # attr_accessible :title, :body
  belongs_to :volume
  has_many :verses

  def chapters
    # No Data
  end

  def self.get_books(volume_id)
    book = Book.where("volume_id = ?", volume_id)
  end

  def self.get_book(volume, slug)
    book = volume.books.where("lds_org = ?", slug).first
  end

  def self.get_verses(book, chapter)
    verses = book.verses.where('chapter = ?', chapter)
    verses.each_with_index do |verse, index|
      verse[:verse] = index + 1
    end
  end
end
