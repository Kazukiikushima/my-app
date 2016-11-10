class CreateEstimates < ActiveRecord::Migration
  def change
    create_table :estimates do |t|
      t.string :name
      t.integer :fee
      t.string :floortype
      t.text :comment
      t.string :place
      t.references :realtor, index: true, foreign_key: true
      t.string :image

      t.timestamps null: false
    end
  end
end
