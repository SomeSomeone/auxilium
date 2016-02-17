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



      # generate list question (must be faster)
      3.times{|level| # 3 is count of level
        Question.where(level: level).sample(5).each{|question| # 5 is count of questions
          @result.switches.create(question_id: question.id)
        }
      }

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
          if(QuestionsResult.delete_all(result_id: @result.id , question_id: @question_get.id )>0)
            @result.question_count+=1
            @result.save
          end
        else
          QuestionsResult.delete_all(result_id: @result.id )
          redirect_to result_in_game_path(id: params[:id]) and return
        end
    
      end

      
      #old
      #offset = rand(Question.count)
      #@question = Question.offset(offset).first
      

      #new
      #random question in random question list
      @question = @result.questions.where(level: @result.question_count/5 ).sample(1).first # 5 is count of questions 

      if !(@question.nil?||@result.question_count>=15)
        @answers = @question.answer #answer for question
      else
        QuestionsResult.delete_all(result_id: @result.id )
        redirect_to result_in_game_path(id: params[:id])        
      end



    
    end
  end

    def result_in_game
      @result=Result.find_by id: params[:id]
      if @result.nil?
        redirect_to root_path      
      end
  end
end
