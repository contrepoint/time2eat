class AddMadeByUserToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :made_by_id, :integer
  end
end
