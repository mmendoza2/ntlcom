class ChangeColumnDescripcionOfEstados < ActiveRecord::Migration
  def change
    remove_column :estados, :descripcion
    add_column :estados, :descripcion, :text
  end
end
