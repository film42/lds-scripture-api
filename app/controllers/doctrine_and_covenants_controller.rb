class DoctrineAndCovenantsController < ApplicationController

  def index
    @volume = Volume.get_volume('dc')
    render 'doctrine_and_covenants/index.json'
  end

  def chapter
    volume = Volume.get_volume('dc')
    @verses = Volume.get_verses(volume, params[:chapter])
    render 'doctrine_and_covenants/chapter.json'
  end

  def verses
    volume = Volume.get_volume('dc')
    verses = Volume.get_verses(volume, params[:chapter])
    @verses = Verse.get_verses(verses, params[:verses])
    render 'doctrine_and_covenants/verses.json'
  end

end
