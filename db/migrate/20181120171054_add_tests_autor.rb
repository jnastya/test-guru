class AddTestsAutor < ActiveRecord::Migration[5.1]
  def change
    add_reference :tests, :author, foregin_key: {to_table: :users}, null: false
  end
end
