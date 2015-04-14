class AddColumnBarrioToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :barrio, :string
  end
end
