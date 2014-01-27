class ChangeColumnDescripcionMicrositios3 < ActiveRecord::Migration
  def change
    remove_column :micrositios, :introtext
    add_column :micrositios, :introtext, :text
  end
end
