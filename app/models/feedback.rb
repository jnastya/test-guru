class Feedback
  include ActiveModel::Model

  attr_accessor :email, :message

  validates :email, presence: true
  validates :message, presence: true
end
