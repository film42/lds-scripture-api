class Verse < ActiveRecord::Base
  set_primary_key "id"
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

end
