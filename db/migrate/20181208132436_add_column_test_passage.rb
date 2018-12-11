class AddColumnTestPassage < ActiveRecord::Migration[5.1]
  def change
    add_column :test_passages, :correct_questions, :integer, default: 0
    add_reference :test_passages, :current_question, foreign_key: { to_table: :questions }
  end
end
