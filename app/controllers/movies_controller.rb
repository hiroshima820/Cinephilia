class MoviesController < ApplicationController
  def index
  end

  def search
    @search_term = params[:looking_for]
    @movie_results = Movie.search(@search_term)["results"]
    @watcheds = current_user.watcheds
    @checks = current_user.checks
  end

  def show
    @movie_info = Movie.details(params[:id])
    @videos = Movie.videos(params[:id])['results']
    @crews = Movie.credits(params[:id])['crew']
    @directors = []
    @writers = []
    @screenplays = []
    @crews.each do |crew|
      if crew['job'] == "Director"
        @directors << crew
      elsif crew['job'] == "Writer"
        @writers << crew
      elsif crew['job'] == "Screenplay"
        @screenplays << crew
      end
    end
    @casts = Movie.credits(params[:id])['cast']
    @watched = current_user.watcheds.find_by(tmdb_movie_id: @movie_info["id"]) || Watched.new
    @check = current_user.checks.find_by(tmdb_movie_id: @movie_info["id"]) || Check.new
  end

end
