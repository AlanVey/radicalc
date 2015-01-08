class AddValueToSolution < ActiveRecord::Migration
  def change
    add_column :solutions, :value, :string
  end
end
