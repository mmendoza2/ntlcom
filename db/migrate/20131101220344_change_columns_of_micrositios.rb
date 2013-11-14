class ChangeColumnsOfMicrositios < ActiveRecord::Migration
  def change

    def up
      change_column :micrositios, :descripcion, :text
      change_column :micrositios, :comollegar, :text
    end
    def down
      # This might cause trouble if you have strings longer
      # than 255 characters.
      change_column :micrositios, :descripcion, :string
      change_column :micrositios, :comollegar, :string
    end

  end
end
