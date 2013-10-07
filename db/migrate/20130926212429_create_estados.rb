class CreateEstados < ActiveRecord::Migration
  def change
    create_table :estados do |t|

      t.timestamps
    end
  end
end
