class AddColumnSlugToActividades5 < ActiveRecord::Migration
  def change
  end
  add_index :actividades, :slug
end
