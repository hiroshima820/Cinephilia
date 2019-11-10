class MoviesController < ApplicationController

  def index
    
  end

  def search
  	@search_term = params[:looking_for]
  	@movie_results = Movie.search(@search_term)["results"]
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

    # @genres = Movie.genres()
    # @credit_details = Movie.credit_details(@credits["cast"][0]["credit_id"])
    # @credits["cast"][0]["credit_id"]でcredit_id取得
    # @credit_details["person"]["name"]で俳優名取得
  end

end
