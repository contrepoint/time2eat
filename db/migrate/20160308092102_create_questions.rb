class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer "group_id", foreign_key: true
      t.text "question_text"
      t.string "question_type"
      t.timestamps null: false
    end
  end
end
