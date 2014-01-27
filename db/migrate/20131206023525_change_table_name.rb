class ChangeTableName < ActiveRecord::Migration
  def change
    rename_table :actividadpadre, :actividadespadre
  end
end
