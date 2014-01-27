class AddColumnEstado < ActiveRecord::Migration
  def change
    add_column :estados, :estado, :string
  end
end
