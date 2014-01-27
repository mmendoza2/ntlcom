class AddColumnPrincipalToEventos < ActiveRecord::Migration
  def change
    add_column :eventos, :principal, :integer
  end
end
