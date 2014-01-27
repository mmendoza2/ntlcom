class AddColumnToEventos < ActiveRecord::Migration
  def change
    add_column :eventos, :diaevento, :string
    add_column :eventos, :d1, :string
    add_column :eventos, :d2, :string
    add_column :eventos, :d3, :string
    add_column :eventos, :d4, :string
    add_column :eventos, :d5, :string
    add_column :eventos, :d6, :string

  end
end
