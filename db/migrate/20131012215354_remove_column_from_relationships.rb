class RemoveColumnFromRelationships < ActiveRecord::Migration
  def change
    remove_column :relationships, :evento_id
    remove_column :relationships, :micrositio_id
  end
end
