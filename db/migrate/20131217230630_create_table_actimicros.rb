class CreateTableActimicros < ActiveRecord::Migration
  def change
    create_table :actimicros do |t|
      t.integer :actividad_id
      t.integer :micrositio_id

    end
  end
end
