class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
    	t.integer "user_id", foreign_key: true
    	t.integer "question_options_id", foreign_key: true
      t.timestamps null: false
    end
  end
end
