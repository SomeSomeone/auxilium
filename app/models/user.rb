class User < ActiveRecord::Base
	has_many :result
	validates :name ,presence: true,	length: {maximum:50}
	
	VALID_MAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :mail, presence: true,	length: {maximum:255},
										format:{with: VALID_MAIL_REGEX},
										uniqueness: true
	
	validates :password, length: {minimum:6}, allow_nil: true
	has_secure_password

	before_save:downcase_mail
	
	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost	?	BCrypt::Engine::MIN_COST :
														BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end
	private

		def downcase_mail
			self.mail.downcase!
		end
	
end