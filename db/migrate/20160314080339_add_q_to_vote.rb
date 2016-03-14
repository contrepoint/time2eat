class AddQToVote < ActiveRecord::Migration
  def change
    add_column :votes, :q, :integer
  end
end
