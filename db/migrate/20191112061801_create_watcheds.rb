class CreateWatcheds < ActiveRecord::Migration[5.2]
  def change
    create_table :watcheds do |t|
      t.integer    :user_id
      t.integer    :tmdb_movie_id
      t.integer    :rate
      t.text       :review

      t.timestamps
    end
  end
end
