class AddColumnsToMicrositios < ActiveRecord::Migration
  def change
    add_column :micrositios, :descripcion, :text
    add_column :micrositios, :status, :integer
    add_column :micrositios, :created, :datetime
    add_column :micrositios, :publish_up, :datetime
    add_column :micrositios, :urls, :text
    remove_column :micrositios, :introtext
  end
end
