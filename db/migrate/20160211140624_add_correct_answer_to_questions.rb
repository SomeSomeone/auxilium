class AddCorrectAnswerToQuestions < ActiveRecord::Migration
  def change
    add_reference :questions, :correct_answer, index: true
    add_foreign_key :questions, :correct_answers
  end
end
