class AddColumnsToActividades < ActiveRecord::Migration
  def change
    add_column :actividades, :tagid, :integer
    add_column :actividades, :catid, :integer
    add_column :actividades, :tagparent, :integer
    add_column :actividades, :descripcion, :string
    add_column :actividades, :status, :string
    add_column :actividades, :icono, :string
    add_column :actividades, :photo_file_name,    :string
    add_column :actividades, :photo_content_type, :string
    add_column :actividades, :photo_file_size,    :integer
    add_column :actividades, :photo_updated_at,   :datetime
  end
end
