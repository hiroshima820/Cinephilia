class DeleteTables < ActiveRecord::Migration[5.2]
  def change
  	drop_table :directors
  	drop_table :writers
  	drop_table :casts
  end
end
