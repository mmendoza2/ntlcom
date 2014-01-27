class AddColumnToActividadPadre < ActiveRecord::Migration
  def change
    add_column :actividadpadre, :actividadpadre, :string
  end
end
