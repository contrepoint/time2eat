class ChangeNames < ActiveRecord::Migration
 def change
    rename_column :votes, :question_options_id, :question_option_id
  end
end
