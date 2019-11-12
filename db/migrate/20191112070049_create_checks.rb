class CreateChecks < ActiveRecord::Migration[5.2]
  def change
    create_table :checks do |t|
      t.integer :user_id
      t.integer :tmdb_movie_id
      t.boolean :prepare

      t.timestamps
    end
  end
end
