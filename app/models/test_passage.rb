class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_question, on: %i[create update]

  PASSAGE_PERCENT = 85

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def total_result
    (correct_questions.to_f / test.questions.count * 100).round
  end

  def success?
    total_result >= PASSAGE_PERCENT
  end

  def current_question_counter
    test.questions.count - test.questions.order(:id).where('id > ?', current_question.id).count
  end

  private

  def before_validation_set_question
    self.current_question = if current_question.nil?
                              test.questions.first
                            else
                              next_question
                            end
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count
    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
