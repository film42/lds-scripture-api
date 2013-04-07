class PearlOfGreatPriceController < ApplicationController

  def index
    @volume = Volume.get_volume('pgp')
    @books = Book.get_books(@volume.id)
    render 'pearl_of_great_price/index.json'
  end

  def book
    @book = Book.get_book(params[:book])
    render 'pearl_of_great_price/book.json'
  end

  def chapter
    book = Book.get_book(params[:book])
    @verses = Book.get_verses(book, params[:chapter])
    render 'pearl_of_great_price/chapter.json'
  end

  def verses
    book = Book.get_book(params[:book])
    verses = Book.get_verses(book, params[:chapter])
    @verses = Verse.get_verses(verses, params[:verses])
    render 'pearl_of_great_price/verses.json'
  end

end
