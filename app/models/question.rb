class Question < ActiveRecord::Base
	has_many :answer

	validates :correct_answer_id ,presence: true

end
