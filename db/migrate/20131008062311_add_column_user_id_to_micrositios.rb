class AddColumnUserIdToMicrositios < ActiveRecord::Migration
  def change
    add_column :micrositios, :user_id, :integer
  end
end
