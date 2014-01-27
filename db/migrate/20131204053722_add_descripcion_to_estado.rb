class AddDescripcionToEstado < ActiveRecord::Migration
  def change
    add_column :estados, :descripcion, :string
  end
end
