class StaticsController < ApplicationController
  def root
  end

  def about
  end

  def game
    if logger_in?
    	@result=Result.new
    	@result.user=current_user
    	@result.question_count=0
      @result.save
    else
      redirect_to root_path
    end

  end

  def questions
    @result=Result.find_by id: params[:id]
    if @result.nil?
      redirect_to root_path
    else
      if( params[:answer] || params[:question])
        @question_get=Question.find_by id: params[:question]
        if (@question_get.correct_answer_id==params[:answer].to_i)
          @result.question_count+=1
          @result.save
        else
          redirect_to result_in_game_path(id: params[:id])
          #else give result
        end
      end
      offset = rand(Question.count)
      @question = Question.offset(offset).first
      @answers = @question.answer
    end
  end

    def result_in_game
      @result=Result.find_by id: params[:id]
      if @result.nil?
        redirect_to root_path      
      end
  end
end
