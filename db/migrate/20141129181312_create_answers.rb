class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :test_id
      t.integer :user_id
      t.string :value
      t.string :status

      t.timestamps
    end
  end
end
