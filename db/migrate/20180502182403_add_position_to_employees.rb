class AddPositionToEmployees < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :position, :string
  end
end
