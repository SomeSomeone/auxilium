class Question < ActiveRecord::Base
	has_many :answer
	has_one :answer as :correct_answer
	validates :correct_answer ,presence: true
end
