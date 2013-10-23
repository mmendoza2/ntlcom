class AddColumnEventosToRelation < ActiveRecord::Migration
  def change
    add_column :relationships, :evento_id, :integer
    add_column :relationships, :micrositio_id, :integer
  end
end
