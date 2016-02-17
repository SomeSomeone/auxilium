class Result < ActiveRecord::Base
  belongs_to :user

  has_many :switches , class_name: "QuestionsResult" ,foreign_key: "result_id",dependent: :destroy
  has_many :questions ,  through: :switches , source: :question
  


  validates :user_id ,presence: true
end
