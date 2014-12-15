class AddPrivilegeToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :privilege, :string
  end
end
