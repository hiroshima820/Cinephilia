class PeopleController < ApplicationController
	def show
	  	@person_info = Person.details(params[:id])
	  	@person_works = Person.movie_credits(params[:id])
	  	@directings = []
	    @person_works['crew'].each do |crew|
	      if crew['department'] == "Directing"
	        @directings << crew
	      end
	    end
	    @writings = []
	    @person_works['crew'].each do |crew|
	      if crew['department'] == "Writing"
	        @writings << crew
	      end
	    end
  	end
end
