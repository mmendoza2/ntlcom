class AddColumnSlugToActividades < ActiveRecord::Migration
  def change
    remove_column :actividades, :slug
    add_column :actividades, :slug, :string
  end

end
