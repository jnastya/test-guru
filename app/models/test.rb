class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages
  belongs_to :author, class_name: "User"

  def self.title(category_title)
    joins('JOIN categories ON tests.category_id = categories.id')
      .where(categories: { title: category_title })
      .order(title: :desc)
      .pluck(:title)
  end
end
