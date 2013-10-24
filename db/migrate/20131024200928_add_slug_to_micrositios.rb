class AddSlugToMicrositios < ActiveRecord::Migration
  def change

    add_column :micrositios, :slug, :string
    add_index :micrositios, :slug
  end
end
