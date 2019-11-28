class DeleteTables < ActiveRecord::Migration[5.2]
  def change
    drop_table :movies
    drop_table :people
  end
end
