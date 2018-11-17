class AddForeignKey < ActiveRecord::Migration[5.1]
  def change
    add_reference :tests, :category, foreign_key: true
    add_reference :questions, :test, foreign_key: true
    add_reference :answers, :question, foreign_key: true
    add_reference :tests, :author, foregin_key: {to_table: :users}
  end
end
