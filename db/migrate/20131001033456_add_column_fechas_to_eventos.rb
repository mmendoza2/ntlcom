class AddColumnFechasToEventos < ActiveRecord::Migration
  def change
    add_column :eventos, :fechainicio, :integer
    add_column :eventos, :fechafin, :integer
    add_column :eventos, :mes, :integer
    add_column :eventos, :dia, :integer
    add_column :eventos, :actividad, :integer

  end
end
