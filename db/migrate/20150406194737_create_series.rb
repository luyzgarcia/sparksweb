class CreateSeries < ActiveRecord::Migration
  def change
    create_table :series do |t|
      t.string :titulo
      t.belongs_to :nivel, index: true

      t.timestamps null: false
    end
  end
end
