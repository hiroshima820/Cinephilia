class Movie < ApplicationRecord
	include HTTParty

  # default_options.update(verify: false) # disable SSL verification(必要に応じて)
  default_params api_key: '9d44b708c15518909f44a17fbdac463e', language: 'en-US' #共通パラメタ
  format :json

  # キーワードによる検索機能
  # https://developers.themoviedb.org/3/search/search-keywordsを参照
  def self.search term
    base_uri 'https://api.themoviedb.org/3/search/movie'
    get("", query: { query: term }) # {}の中身はパラメタ
  end

  # 指定の映画の詳細情報を取得
  # https://developers.themoviedb.org/3/movies/get-movie-detailsを参照
  def self.details id
    base_uri "https://api.themoviedb.org/3/movie/#{id}"
    get("", query: { } ) #パラメタなし
  end

  # 指定のクレジットを取得
  # https://developers.themoviedb.org/3/movies/get-movie-creditsを参照
  def self.credits id
    base_uri "https://api.themoviedb.org/3/movie/#{id}/credits"
    get("", query: { } ) #パラメタなし
  end

  # 指定のクレジットの詳細情報を取得
  # https://developers.themoviedb.org/3/movies/get-credit-detailsを参照
  def self.credit_details id
    base_uri "https://api.themoviedb.org/3/credit/#{id}"
    get("", query: { } ) #パラメタなし
  end

  # 指定の映画の予告編を取得
  # https://developers.themoviedb.org/3/genres/get-movie-listを参照
  def self.videos id
    base_uri "https://api.themoviedb.org/3/movie/#{id}/videos"
    get("", query: { } ) #パラメタなし
  end

  # 指定の映画のジャンルを取得
  # https://developers.themoviedb.org/3/genres/get-movie-listを参照
  def self.genres
    base_uri "https://api.themoviedb.org/3/genre/movie/list"
    get("", query: { } ) #パラメタなし
  end

end
