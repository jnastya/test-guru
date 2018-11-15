class AddIdNullConstraint < ActiveRecord::Migration[5.1]
  def change
    change_column_null(:answers, :question_id, false)
    change_column_null(:questions, :test_id, false)
    change_column_null(:tests, :category_id, false)
    change_column_null(:tests, :author_id, false)
    change_column_null(:test_passages, :test_id, false)
    change_column_null(:test_passages, :user_id, false)
  end
end
