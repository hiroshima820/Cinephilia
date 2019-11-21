class ChecksController < ApplicationController
  def create
    check = current_user.checks.new
    check.tmdb_movie_id = params[:movie_id]
    check.save!
    redirect_to movie_path(params[:movie_id])
  end

  def update
    check = current_user.checks.find_by(tmdb_movie_id: params[:movie_id])
    check.update(prepare: true)
    redirect_to movie_path(params[:movie_id])
  end

  def destroy
    check = current_user.checks.find_by(tmdb_movie_id: params[:movie_id])
    check.destroy
    redirect_to movie_path(params[:movie_id])
  end

end
