class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :user_id
      t.integer :test_id
      t.string :value

      t.timestamps
    end
  end
end
