class CreateTableRelationestado < ActiveRecord::Migration
  def change
    create_table :relationestados do |t|
        t.integer :follower_id
        t.integer :followed_id

        t.timestamps
      end
      add_index :relationestados, :follower_id
      add_index :relationestados, :followed_id
      add_index :relationestados, [:follower_id, :followed_id], unique: true

      add_column :estados, :photo_file_name,    :string
      add_column :estados, :photo_content_type, :string
      add_column :estados, :photo_file_size,    :integer
      add_column :estados, :photo_updated_at,   :datetime

  end
end
