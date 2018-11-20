class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages
  belongs_to :author, class_name: "User"

  validates :title, presence: true
  validates :title, uniqueness: { scope: :level}

  validates :level, numericality: { only_integer: true }

  scope :easy, -> { where(level: 0..1) }
  scope :normal, -> { where(level: 2..4) }
  scope :difficult, -> { where(level: 5..Float::INFINITY) }
  scope :test_title, -> (category_title) { joins(:category).where(categories: { title: category_title }) }
  scope :sorted_title, -> { :test_title.order(title: :desc) }

end
