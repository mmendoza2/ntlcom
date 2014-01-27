class AddColumPoblacionToEventos < ActiveRecord::Migration
  def change
    add_column :eventos, :poblacion, :string
  end
end
