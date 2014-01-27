class AddColumnToMicrositiosAgain < ActiveRecord::Migration
  def change
    add_column :micrositios, :estado_id, :integer
  end
end
