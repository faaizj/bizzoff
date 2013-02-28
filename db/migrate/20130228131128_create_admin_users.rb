class CreateAdminUsers < ActiveRecord::Migration
  def change
    create_table :admin_users do |t|
    t.string :username, :length => 25
    t.string :hashed_password, :length => 40
    t.integer :admin_role_id
    t.string :salt
    t.string :email, :length => 200
      t.timestamps
    end
    add_index("admin_users","username")
    
  end
end
