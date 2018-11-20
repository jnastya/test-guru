class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: "Test", foreign_key: "author_id"

  validates :email, presence: true

  def tests_passage(level)
    Test.joins(:test_passages).where(test_passages: {user_id: id }).where(tests: { level: level })
  end
end
