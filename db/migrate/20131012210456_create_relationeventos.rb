class CreateRelationeventos < ActiveRecord::Migration
  def change
    create_table :relationeventos do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
    add_index :relationeventos, :follower_id
    add_index :relationeventos, :followed_id
    add_index :relationeventos, [:follower_id, :followed_id], unique: true
  end
end
