class BibleController < ApplicationController

  def index
    @volumes = []
    @volumes << Volume.get_volume('ot')
    @volumes << Volume.get_volume('nt')
    render 'bible/index.json'
  end

  def testament
    testament = params[:testament]
    return if testament != "ot" and testament != "nt"

    @volume = Volume.get_volume(params[:testament])
    render 'bible/testament.json'
  end

  def book
    testament = params[:testament]
    return if testament != "ot" and testament != "nt"

    volume = Volume.get_volume(params[:testament])
    @book = Book.get_book(volume, params[:book])
    render 'bible/book.json'
  end

  def chapter
    testament = params[:testament]
    return if testament != "ot" and testament != "nt"

    volume = Volume.get_volume(params[:testament])
    book = Book.get_book(volume, params[:book])
    @verses = Book.get_verses(book, params[:chapter])
    render 'bible/chapter.json'
  end

  def verses
    testament = params[:testament]
    return if testament != "ot" and testament != "nt"

    volume = Volume.get_volume(params[:testament])
    book = Book.get_book(volume, params[:book])
    verses = Book.get_verses(book, params[:chapter])
    @verses = Verse.get_verses(verses, params[:verses])
    render 'bible/verses.json'
  end

end
