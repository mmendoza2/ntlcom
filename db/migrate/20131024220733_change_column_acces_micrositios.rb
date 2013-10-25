class ChangeColumnAccesMicrositios < ActiveRecord::Migration
  def change

    change_column :micrositios, :acces, :access
  end
end
