class RemoveColumnFromEventos < ActiveRecord::Migration
  def change
    remove_column :micrositios, :username
    remove_column :micrositios, :title
    remove_column :micrositios, :alias
    remove_column :micrositios, :title_alias
    remove_column :micrositios, :state
    remove_column :micrositios, :sectionid
    remove_column :micrositios, :mask
    remove_column :micrositios, :created_by_alias
    remove_column :micrositios, :created
    remove_column :micrositios, :modified
    remove_column :micrositios, :modified_by
    remove_column :micrositios, :checked_out
    remove_column :micrositios, :checked_out_time
    remove_column :micrositios, :publish_up
    remove_column :micrositios, :publish_down
    remove_column :micrositios, :images
    remove_column :micrositios, :urls
    remove_column :micrositios, :attribs
    remove_column :micrositios, :version
    remove_column :micrositios, :parentid
    remove_column :micrositios, :metadesc
    remove_column :micrositios, :acces
    remove_column :micrositios, :descripcion
    remove_column :micrositios, :metadata
    remove_column :micrositios, :fulltext

  end
end
