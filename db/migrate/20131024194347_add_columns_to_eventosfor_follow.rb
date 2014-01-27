class AddColumnsToEventosforFollow < ActiveRecord::Migration
  def change
    create_table :relationmicrositios do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
    add_index :relationmicrositios, :follower_id
    add_index :relationmicrositios, :followed_id
    add_index :relationmicrositios, [:follower_id, :followed_id], unique: true
  end
end
