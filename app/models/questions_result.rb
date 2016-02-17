class QuestionsResult < ActiveRecord::Base
	belongs_to :question , class_name: "Question"
	belongs_to :result , class_name: "Result"
	validates :question_id , presence: true
	validates :result_id , presence: true
end
