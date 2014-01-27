class AddColumnEstadoIdToEventos < ActiveRecord::Migration
  def change
    add_column :eventos, :estado_id, :integer
  end
end
