class AddPaperCliptoActividad < ActiveRecord::Migration
  def change
    def change
      add_column :actividades, :photo_file_name,    :string
      add_column :actividades, :photo_content_type, :string
      add_column :actividades, :photo_file_size,    :integer
      add_column :actividades, :photo_updated_at,   :datetime
    end
  end
end
