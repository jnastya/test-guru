class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages
  belongs_to :author, class_name: "User"

  validates :title, presence: true, uniqueness: true

  validates :level, numericality: { only_integer: true }

  scope :easy, -> { where(level: 0..1) }
  scope :normal, -> { where(level: 2..4) }
  scope :difficult, -> { where(level: 5..Float::INFINITY) }
  scope :test_title, -> (category_title) { joins(:category).where(categories: { title: category_title }).order(title: :desc).pluck(:title) }


  # def self.title(category_title)
  #   joins('JOIN categories ON tests.category_id = categories.id')
  #     .where(categories: { title: category_title })
  #     .order(title: :desc)
  #     .pluck(:title)
  # end
end
