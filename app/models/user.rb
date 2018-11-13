class User < ApplicationRecord
  def tests_passage(level)
    Test.joins('JOIN test_passage ON tests_id = test.passages.id')
        .where(test_passages: {user_id: id })
        .where(level: level)
  end
end
