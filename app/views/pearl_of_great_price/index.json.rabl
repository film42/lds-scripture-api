object @volume
attributes :volume_title => :title, 
  :volume_title_long => :title_long,  
  :volume_subtitle => :subtitle, 
  :lds_org => :slug, 
  :num_chapters => :chpaters, 
  :num_verses => :verses

child :books do 
  attributes :book_title => :title, 
    :book_title_long => :title_long,  
    :book_title_short => :title_short, 
    :lds_org => :slug, 
    :num_chapters => :chpaters, 
    :num_verses => :verses
end