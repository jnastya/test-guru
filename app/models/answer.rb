class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true

  validate :validate_amount_answers

  scope :correct, -> { where(correct: true) }

  private

  def validate_amount_answers
    errors.add(:question, 'Превышено количество допустимых ответов') if question.answers.size >= 4
  end
end
