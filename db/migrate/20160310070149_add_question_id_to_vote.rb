class AddQuestionIdToVote < ActiveRecord::Migration
  def change
    add_column :votes, :question_id, :integer, references: :questions
  end
end
