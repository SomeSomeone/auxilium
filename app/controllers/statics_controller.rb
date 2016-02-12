class StaticsController < ApplicationController
  def root
  end

  def about
  end

  def game
 
  	@result=Result.new
  	@result.user=current_user
  	@result.question_count=0

  end

  def questions

    offset = rand(Question.count)
    @question = Question.offset(offset).first
    @answers = @question.answer
  end
end
