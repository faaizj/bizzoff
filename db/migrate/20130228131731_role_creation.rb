class RoleCreation < ActiveRecord::Migration
  def up
    add_index(:admin_users, :role_id)
    add_index(:admin_users, :username)
    rename_column(:admin_users,:role_id, :admin_role_id)
  end

  def down
  end
end
