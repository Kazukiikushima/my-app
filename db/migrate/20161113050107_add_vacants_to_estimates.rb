class AddVacantsToEstimates < ActiveRecord::Migration
  def change
    add_column :estimates, :vacants, :integer
  end
end
