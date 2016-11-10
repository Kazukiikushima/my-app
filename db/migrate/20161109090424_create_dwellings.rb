class CreateDwellings < ActiveRecord::Migration
  def change
    create_table :dwellings do |t|
      t.references :estimate, index: true, foreign_key: true
      t.references :person, index: true, foreign_key: true
      t.text :comment
      t.date :start_time
      t.date :end_time

      t.timestamps null: false
    end
  end
end
