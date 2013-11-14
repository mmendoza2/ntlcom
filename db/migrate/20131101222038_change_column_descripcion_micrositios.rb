class ChangeColumnDescripcionMicrositios < ActiveRecord::Migration
  def change
    remove_column :micrositios, :descripcion
    add_column :micrositios, :descripcion, :text
  end
end
