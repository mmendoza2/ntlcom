class AddColumnToActividadesPadre < ActiveRecord::Migration
  def change
    add_column :actividadpadre, :status, :integer
  end
end
