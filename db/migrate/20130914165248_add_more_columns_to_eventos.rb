class AddMoreColumnsToEventos < ActiveRecord::Migration
  def change

    add_column :eventos, :d7, :string
    add_column :eventos, :d8, :string
    add_column :eventos, :d9, :string
    add_column :eventos, :d10, :string
  end
end
