class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.references :sender, index: true
      t.references :receiver, index: true
      t.text :comment

      t.timestamps null: false
    end
  end
end
