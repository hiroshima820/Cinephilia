class PeopleController < ApplicationController
	def show
	  	@person_info = Person.details(params[:id])
	  	@person_works = Person.movie_credits(params[:id])
	  	# binding.pry
  	end
end
