class AddColumnUserToMcirositios < ActiveRecord::Migration
  def change
    add_column :micrositios, :user_id, :integer
    add_column :micrositios, :estado, :integer
  end
end
