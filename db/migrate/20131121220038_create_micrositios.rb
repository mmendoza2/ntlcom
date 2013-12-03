class CreateMicrositios < ActiveRecord::Migration
  def change
    create_table :actividades do |t|
      t.string :actividad
      t.string :actividadpadre
    end


    create_table :relationactividades do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
    add_index :relationactividades, :follower_id
    add_index :relationactividades, :followed_id
    add_index :relationactividades, [:follower_id, :followed_id], unique: true


  end


end
