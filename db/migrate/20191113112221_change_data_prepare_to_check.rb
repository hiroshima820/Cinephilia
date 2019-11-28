class ChangeDataPrepareToCheck < ActiveRecord::Migration[5.2]
  def change
    change_column_default :checks, :prepare, false
    change_column_null :checks, :prepare, false
  end
end
