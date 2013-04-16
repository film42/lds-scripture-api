class Volume < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :books
  has_many :verses

  def self.get_volume(slug)
    volume = Volume.where("lds_org = ?", slug).first
    return volume
  end

  def self.get_book(books, slug)
    book = Book.where("lds_org = ?", slug).first
  end

  def self.get_books(volume_id)
    book = Book.where("volume_id = ?", volume_id)
  end

  def self.get_verses(volume, chapter)
    verses = volume.verses.where('chapter = ?', chapter)
    verses.sort! do |x, y|
      x.id <=> y.id
    end
    verses.each_with_index do |verse, index|
      verse[:verse] = index + 1
    end
  end
end
