class CreateTableActividadpadre < ActiveRecord::Migration
  def change
    create_table :actividadpadre do |t|
      t.integer :tagid
      t.integer :catid
      t.string :descripcion
      t.string :slug
      t.string :icono
      t.string :photo_file_name
      t.string :photo_content_type
      t.integer :photo_file_size
      t.datetime :photo_updated_at
    end
    add_index :actividadpadre, :slug
  end

end
