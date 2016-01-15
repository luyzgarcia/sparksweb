class CreateTipoPeriodos < ActiveRecord::Migration
  def change
    create_table :tipo_periodos do |t|
      t.string :titulo
      t.integer :status
      
      t.timestamps null: false
    end
    
    add_column :niveis, :created_at, :datetime
    add_column :niveis, :updated_at, :datetime
  end
end
