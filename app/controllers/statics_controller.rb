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

end
