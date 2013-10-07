class AddColumnSlug < ActiveRecord::Migration
  def change
    add_column :estados, :slug, :string
    add_index :estados, :slug
  end
end
