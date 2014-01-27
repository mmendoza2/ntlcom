class AddColumPoblacion < ActiveRecord::Migration
  def change
    add_column :estados, :poblacion, :string
  end
end
