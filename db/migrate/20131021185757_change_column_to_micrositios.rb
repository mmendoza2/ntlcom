class ChangeColumnToMicrositios < ActiveRecord::Migration
  def change
    add_column :micrositios, :title, :string
    add_column :micrositios, :alias, :string
    add_column :micrositios, :title_alias, :string
    add_column :micrositios, :introtext, :string
    add_column :micrositios, :fulltext, :string
    add_column :micrositios, :state, :integer
    add_column :micrositios, :sectionid, :integer
    add_column :micrositios, :mask, :integer
    add_column :micrositios, :catid, :integer
    add_column :micrositios, :created, :datetime
    add_column :micrositios, :created_by, :integer
    add_column :micrositios, :created_by_alias, :string
    add_column :micrositios, :modified, :datetime
    add_column :micrositios, :modified_by, :integer
    add_column :micrositios, :checked_out, :integer
    add_column :micrositios, :checked_out_time, :datetime
    add_column :micrositios, :publish_up, :datetime
    add_column :micrositios, :publish_down, :datetime
    add_column :micrositios, :images, :text
    add_column :micrositios, :urls, :text
    add_column :micrositios, :attribs, :text
    add_column :micrositios, :version, :integer
    add_column :micrositios, :parentid, :integer
    add_column :micrositios, :ordering, :integer
    add_column :micrositios, :metakey, :text
    add_column :micrositios, :metadesc, :text
    add_column :micrositios, :acces, :integer
    add_column :micrositios, :hits, :integer
    add_column :micrositios, :metadata, :text
    add_column :micrositios, :imagen, :text
    add_column :micrositios, :lugar, :text
    add_column :micrositios, :munciudad, :text
    add_column :micrositios, :mapa, :text
    add_column :micrositios, :comollegar, :text
    add_column :micrositios, :votos, :integer
    add_column :micrositios, :fb_author, :string
    add_column :micrositios, :tagcategorias, :string

  end
end
