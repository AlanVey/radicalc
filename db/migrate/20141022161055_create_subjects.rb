class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.text :body
      t.text :user_id

      t.timestamps
    end
  end
end
