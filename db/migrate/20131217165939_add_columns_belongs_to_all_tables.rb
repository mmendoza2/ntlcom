class AddColumnsBelongsToAllTables < ActiveRecord::Migration
  def change
    add_column :actividades, :actividadpadre_id, :integer
    add_column :eventos, :actividad_id, :integer
    add_column :micrositios, :actividad_id, :integer
  end
end
