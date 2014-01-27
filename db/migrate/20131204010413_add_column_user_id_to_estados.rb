class AddColumnUserIdToEstados < ActiveRecord::Migration
  def change
    add_column :estados, :user_id, :integer
  end
end
