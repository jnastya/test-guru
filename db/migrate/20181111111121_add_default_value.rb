class AddDefaultValue < ActiveRecord::Migration[5.1]
  def change
    add_column(:tests, :level, :integer, default: 0)
    add_column(:answers, :correct, :boolean, default: false)
  end
end
