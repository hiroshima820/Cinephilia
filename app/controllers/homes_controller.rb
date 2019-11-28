class HomesController < ApplicationController
  def top
    @trend_movies = Movie.trendings["results"]
    @watcheds = current_user.watcheds
    @checks = current_user.checks
  end

  def about
  end
end
