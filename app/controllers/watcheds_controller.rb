class WatchedsController < ApplicationController
  def new
    @watched = Watched.new
  end

  def create
    watched = current_user.watcheds.new(watched_create)
    watched.tmdb_movie_id = params[:movie_id]
    watched.save!
    redirect_to movie_path(params[:movie_id])
  end

  def edit
    @watched = current_user.watcheds.find_by(tmdb_movie_id: params[:movie_id])
  end

  def update
    watched = current_user.watcheds.find_by(tmdb_movie_id: params[:movie_id])
    watched.update(watched_update)
    redirect_to movie_path(params[:movie_id])
  end

  def destroy
    watched = current_user.watcheds.find_by(tmdb_movie_id: params[:movie_id])
    watched.destroy
    redirect_to movie_path(params[:movie_id])
  end

  private
  def watched_create
    params.require(:watched).permit(:rate, :review)
  end

  def watched_update
    params.require(:watched).permit(:rate, :review)
  end

end
