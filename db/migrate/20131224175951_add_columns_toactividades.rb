class AddColumnsToactividades < ActiveRecord::Migration
  def change
    add_column :actividades, :categoria_id, :integer
  end
end
