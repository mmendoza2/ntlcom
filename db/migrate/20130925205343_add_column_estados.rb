class AddColumnEstados < ActiveRecord::Migration
  def change
    add_column :eventos, :estado, :string
  end
end
