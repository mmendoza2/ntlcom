class AddColumnToMicrositios < ActiveRecord::Migration
  def change
    add_column :micrositios, :favorito, :integer
  end
end
