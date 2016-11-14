class AddAvatarToEstimates < ActiveRecord::Migration
  def change
    add_column :estimates, :avatar, :string
  end
end
