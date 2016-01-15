class ChangeNameTableRegistros < ActiveRecord::Migration
  def change
  	add_column :registros, :dia, :Date
  	add_column :registros, :hora, :Time
  end
end
