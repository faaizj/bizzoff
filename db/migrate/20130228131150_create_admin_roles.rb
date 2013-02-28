class CreateAdminRoles < ActiveRecord::Migration
  def change
    create_table :admin_roles do |t|
      t.string :role_name
      t.timestamps
    end
  end
end
