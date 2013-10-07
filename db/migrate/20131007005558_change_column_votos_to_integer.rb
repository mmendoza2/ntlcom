class ChangeColumnVotosToInteger < ActiveRecord::Migration
  def change
    change_column :eventos, :votos, :integer
  end
end
