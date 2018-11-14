class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: "Test", foreign_key: "author_id"

  def tests_passage(level)
    Test.joins('JOIN test_passage ON tests_id = test.passages.id')
        .where(test_passages: {user_id: id })
        .where(level: level)
  end
end
