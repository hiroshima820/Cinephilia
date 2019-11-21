class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]
  def show
    @user = User.find(params[:id])
    @watcheds = @user.watcheds
    @watched_movie_ids = []
    @watcheds.each do |watched|
      @watched_movie_ids << watched.tmdb_movie_id
    end
    @checks = @user.checks
    @check_movie_ids = []
    @checks.each do |check|
      @check_movie_ids << check.tmdb_movie_id
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
		if	@user.update(user_params)
			flash[:notice] = "successfully"
			redirect_to user_path(current_user.id)
		else
			flash[:notice] = "error"
			render :edit
		end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
  def correct_user
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user.id)
    end
  end
end
