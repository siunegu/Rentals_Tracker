class CreateTenant
	def self.call(email_address)

		tenant = Tenant.find_by(email: email_address)

		return tenant if tenant.present?

		raw_token, enc_token = Devise.token_generator.generate(
			User, :reset_password_token
		)
		password = SecureRandom.hex(32)

		tenant = Tenant.create(
			email: email_address,
			password: password, 
			password_confirmation: password,
			reset_password_token: enc_token,
			reset_password_sent_at: Time.now
		)

		return tenant, raw_token

	end
end