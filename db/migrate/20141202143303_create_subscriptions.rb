class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :subject_id
      t.integer :user_id
      t.string :status

      t.timestamps
    end
  end
end
