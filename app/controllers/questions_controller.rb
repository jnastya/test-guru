class QuestionsController < ApplicationController

  before_action :find_question, only: %i[show destroy]
  before_action :find_test, only: %i[index create]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render json: { questions: Question.all }
  end

  def show
    render inline: '<%= @question.body %>'
  end

  def new

  end

  def create
    question = @test.questions.new(question_params)
    if question.save
      render plain: question.inspect
    else
      render :new
    end
  end

  def destroy
    @question.destroy
    render plain: 'Question deleted'
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
