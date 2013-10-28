class AddTableMicrositios < ActiveRecord::Migration
  def change
    create_table :micrositios do |t|
    t.string :name
    t.string :descripcion
    t.string :username
    t.string :photo_file_name
    t.string :photo_content_type
    t.string :photo_file_size
    t.datetime :photo_updated_at
    t.string :slug
    t.string :title
    t.string :alias
    t.string :title_alias
    t.string :introtext
    t.string :fulltext
    t.integer :state
    t.integer :sectionid
    t.integer :mask
    t.integer :catid
    t.datetime :created
    t.integer :created_by
    t.string :created_by_alias
    t.datetime :modified
    t.integer :modified_by
    t.integer :checked_out
    t.datetime :checked_out_time
    t.datetime :publish_up
    t.datetime :publish_down
    t.text :images
    t.text :urls
    t.text :attribs
    t.integer :version
    t.integer :parentid
    t.integer :ordering
    t.text :metakey
    t.text :metadesc
    t.integer :acces
    t.integer :hits
    t.text :metadata
    t.text :imagen
    t.text :lugar
    t.text :munciudad
    t.text :mapa
    t.text :comollegar
    t.integer :votos
    t.string :fb_author
    t.string :tagcategorias

    end

    add_index :micrositios, :slug
  end
end
