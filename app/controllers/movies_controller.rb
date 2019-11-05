class MoviesController < ApplicationController
  def search
  	@search_term = params[:looking_for]
  	@movie_results = Movie.search(@search_term)["results"]

  end

  def show
  	@movie_info = Movie.details(params[:id])
  	@genres = Movie.genres()
  	@credits = Movie.credits(params[:id])
  	# binding.pry
  end

  def genre
  	@genres = Movie.genres()
  end
end
