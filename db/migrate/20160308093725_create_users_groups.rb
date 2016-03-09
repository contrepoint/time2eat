class CreateUsersGroups < ActiveRecord::Migration
  def change
    create_table :users_groups do |t|
      t.integer "user_id", foreign_key: true
      t.integer "group_id", foreign_key: true
      t.string "role"
      t.timestamps null: false
    end
  end
end
