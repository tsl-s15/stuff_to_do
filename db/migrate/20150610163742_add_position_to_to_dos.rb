class AddPositionToToDos < ActiveRecord::Migration
  def change
    add_column :to_dos, :position, :integer
  end
end
