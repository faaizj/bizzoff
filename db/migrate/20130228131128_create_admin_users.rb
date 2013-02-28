class CreateAdminUsers < ActiveRecord::Migration
  def change
    create_table :admin_users do |t|
    t.string :username
    t.string :hashed_password
    t.string :role_id
    
      t.timestamps
    end
  end
end
