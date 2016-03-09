class CreateQuestionOptions < ActiveRecord::Migration
  def change
    create_table :question_options do |t|
      t.integer "question_id", foreign_key: true
      t.text "option_text"
      t.timestamps null: false
    end
  end
end
