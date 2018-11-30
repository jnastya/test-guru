class TestsController < ApplicationController

  def index
    render json: { tests: Test.all }
  end

  def new
  end

  def show
    @test = Test.find(params[:id])
    render inline: '<%= @test.title %>'
  end

  def create
    @test = Test.create(test_params)
    if @test.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end
end
