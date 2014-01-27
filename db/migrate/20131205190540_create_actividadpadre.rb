class CreateActividadpadre < ActiveRecord::Migration
  def change
    create_table :relationactividadespadre do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
    add_index :relationactividadespadre, :follower_id
    add_index :relationactividadespadre, :followed_id
    add_index :relationactividadespadre, [:follower_id, :followed_id], unique: true



  end
end
