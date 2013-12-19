class CreateCategoria < ActiveRecord::Migration
  def change
    create_table :categorias do |t|

      t.text   "descripcion"
      t.string   "slug"
      t.string   "name"
      t.string   "imagen"
      t.string   "icono"
      t.string   "photo_file_name"
      t.string   "photo_content_type"
      t.integer  "photo_file_size"
      t.datetime "photo_updated_at"
    end
    add_index :categorias, :slug
  end
end
