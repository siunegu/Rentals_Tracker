class CreateLease
 def self.call(options={})
	 Lease = Lease.new(options)
	 
	 if !Lease.valid?
		 return Lease
	 end

	 begin
		 Stripe::Lease.create(
			 id: options[:stripe_id],
			 amount: options[:amount],
			 currency: 'usd',
			 interval: options[:interval],
			 name: options[:name]
		 )

   rescue Stripe::StripeError => e
		 Lease.errors[:base] << e.message
 		 return Lease
	 end

	 Lease.save
	 return Lease

	 end
end
