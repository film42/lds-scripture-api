class Verse < ActiveRecord::Base
  include PgSearch
  pg_search_scope :find_verse, :against => [:versetext], :using => [:tsearch]

  # attr_accessible :title, :body
  belongs_to :book
  belongs_to :volume

  def self.get_verses(verses, query)
    query = query.split('-')
    if query.size == 1
      return verses[query[0].to_i-1]
    elsif query.size > 1
      return verses[query[0].to_i-1 .. query[1].to_i-1]
    end
  end

  def self.search(query)
    #return Verse.find_verse(query)
    return Verse.where('verseText @@ plainto_tsquery(\'english\', ?)', query)
  end

end
