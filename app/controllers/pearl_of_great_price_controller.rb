class PearlOfGreatPriceController < ApplicationController

  def index
    @volume = Volume.get_volume('pgp')
    render 'pearl_of_great_price/index.json'
  end

  def book
    volume = Volume.get_volume('pgp')
    @book = Book.get_book(volume, params[:book])
    render 'pearl_of_great_price/book.json'
  end

  def chapter
    volume = Volume.get_volume('pgp')
    book = Book.get_book(volume, params[:book])
    @verses = Book.get_verses(book, params[:chapter])
    render 'pearl_of_great_price/chapter.json'
  end

  def verses
    volume = Volume.get_volume('pgp')
    book = Book.get_book(volume, params[:book])
    verses = Book.get_verses(book, params[:chapter])
    @verses = Verse.get_verses(verses, params[:verses])
    render 'pearl_of_great_price/verses.json'
  end

end
