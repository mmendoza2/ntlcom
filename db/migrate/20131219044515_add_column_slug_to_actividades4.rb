class AddColumnSlugToActividades4 < ActiveRecord::Migration
  def change
    add_column :actividades, :slug, :string
  end
end
