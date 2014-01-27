class ChangeColumnTypeMicrositios < ActiveRecord::Migration
  def change
    remove_column :micrositios, :estado
    add_column :micrositios, :estado, :string
  end
end
