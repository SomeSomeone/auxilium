class Question < ActiveRecord::Base
	has_many :answer
	has_and_belongs_to_many :results ,class_name: "QuestionsResult", foreign_key: "result_id"

  	has_many :switches , class_name: "QuestionsResult" ,foreign_key: "question_id"
  	has_many :results ,  through: :switches , source: :result
  



	validates :correct_answer_id ,presence: true

end
