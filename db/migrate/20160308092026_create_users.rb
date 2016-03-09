class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string "name"
      t.string "role"
      t.integer "question_options_id", foreign_key: true
      t.timestamps null: false
    end
  end
end
