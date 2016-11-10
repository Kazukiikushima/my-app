class AddUserprofileToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :phonenumber, :string
    add_column :users, :sex, :string
    add_column :users, :job, :string
    add_column :users, :age, :integer
    add_column :users, :comment, :text
    add_column :users, :type, :string
  end
end
