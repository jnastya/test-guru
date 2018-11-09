class AddColumnTestsLevel < ActiveRecord::Migration[5.1]
  def change
    add_column(:tests, :level, :integer, default: 0)
  end
end
