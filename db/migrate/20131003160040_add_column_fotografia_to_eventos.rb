class AddColumnFotografiaToEventos < ActiveRecord::Migration
  def change
    add_column :eventos, :fotografia, :string
    add_column :eventos, :institucion, :integer
  end
end
