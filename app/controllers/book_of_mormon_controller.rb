class BookOfMormonController < ApplicationController

  def index
    @volume = Volume.get_volume("bm")
    render 'book_of_mormon/index.json'
  end

  def book
    @book = Book.get_book(params[:book])
    render 'book_of_mormon/book.json'
  end

  def chapter
    book = Book.get_book(params[:book])
    @verses = Book.get_verses(book, params[:chapter])
    render 'book_of_mormon/chapter.json'
  end

  def verses
    book = Book.get_book(params[:book])
    verses = Book.get_verses(book, params[:chapter])
    @verses = Verse.get_verses(verses, params[:verses])
    render 'book_of_mormon/verses.json'
  end
  
end
