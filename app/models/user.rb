class User < ActiveRecord::Base
	validates :name ,presence: true,	length: {maximum:50}
	
	VALID_MAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :mail, presence: true,	length: {maximum:255},
										format:{with: VALID_MAIL_REGEX},
										uniqueness: true
	
	validates :password, length: {minimum:6}
	has_secure_password

	before_save:downcase_mail
	private

		def downcase_mail
			self.mail.downcase!
		end
	
end