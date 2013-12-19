class G < ActiveRecord::Migration
  def change
    create_table :imagenes do |t|

      t.string   "slug"
      t.string   "name"
      t.string   "photo_file_name"
      t.string   "photo_content_type"
      t.integer  "photo_file_size"
      t.datetime "photo_updated_at"
      t.integer "user_id"
      t.integer "micrositio_id"
      t.integer "evento_id"
      t.integer "actividad_id"
    end
    add_index :imagenes, :slug
  end


end
