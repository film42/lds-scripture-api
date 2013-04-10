class SearchController < ApplicationController
  def search
    @verses = Verse.search(params[:query])
    render 'search/index.json'
  end
end
