class AddVotedToUsersGroups < ActiveRecord::Migration
  def change
    add_column :users_groups, :voted, :boolean, default: false
  end
end
