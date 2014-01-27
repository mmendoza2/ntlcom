class ChangeColumnDescripcionMicrositios2 < ActiveRecord::Migration
  def change
    remove_column :micrositios, :fulltext
    add_column :micrositios, :fulltext, :text
  end
end
