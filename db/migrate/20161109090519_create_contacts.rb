class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.references :sender, index: true, foreign_key: true
      t.references :receiver, index: true, foreign_key: true
      t.text :comment

      t.timestamps null: false
    end
  end
end
