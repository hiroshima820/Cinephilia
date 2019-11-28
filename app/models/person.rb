class Person < ApplicationRecord
	include ActiveModel::Model 
	include HTTParty

	# default_options.update(verify: false) # disable SSL verification(必要に応じて)
	default_params api_key: ENV['TMDb_API_KEY'], language: 'en-US' #共通パラメタ
	format :json

	# 指定のパーソンの詳細を取得
	# https://developers.themoviedb.org/3/people/get-person-detailsを参照
	def self.details id
		base_uri "https://api.themoviedb.org/3/person/#{id}"
		get("", query: { } ) #パラメタなし
	end

	# 指定のパーソンの映画作品全てを取得
	# https://developers.themoviedb.org/3/people/get-person-movie-creditsを参照
	def self.movie_credits id
		base_uri "https://api.themoviedb.org/3/person/#{id}/movie_credits"
		get("", query: { } ) #パラメタなし
	end
end
