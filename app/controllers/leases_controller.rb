class LeasesController < ApplicationController
	before_filter :authenticate_landlord!, only: [:landlord_leases]

	def new	
		@property = Property.find(params[:property_id])
		@lease = @property.leases.new
	end

	def create
		# binding.pry
		@lease = Lease.new(name: params["lease"]["name"],
											 amount: params["lease"]["amount"],
											 description: params["lease"]["description"],	
											 interval: params["lease"]["interval"],
											 tenant_id: params["lease"]["tenant_id"]
											)

		if @lease.save
			redirect_to root_path
		else
			render :new
		end
	end

	def edit
	end

	def update
		@lease = current_tenant.lease.build
		if !current_tenant.stripe_token && current_tenant.credit_card
			
			token = params[:stripeToken]

			stripe_plan = Stripe::Plan.create(
									    :amount => @lease.property.price, # in cents
									    :currency => "usd",
									    :interval => "month",
									    :name => tenant.property.address,
									    :id => plan_id,
									    :customer => stripe_tenant.id
									    )

			new_customer = Stripe::Customer.create(
				:card => token,
				:plan => plan_id,
				:email => current_tenant.email,
				:description => tenant.property.address
				)			

		# Save Stripe Tenant Stripe_id to Databse for use Later
			current_tenant.stripe_id = new_customer.id # eg. "cus_5ekJlrYS22WMUR"			
		# Save the token as the current tenant's credit card
		current_tenant.credit_card.stripe_id = token

		# Create new subscription on an existing customer
			# customer_id = Stripe::retrieve(new_customer.id)
			# customer_id.subscriptions.create(plan: customer_id)

			customer = Stripe::Customer.retrieve(new_customer.id)
			customer.subscriptions.create(plan: plan_id)
			current_tenant.lease.save		

			current_tenant.lease.stripe_id = token
			current_tenant.lease.save
		end
		@lease.update
	end

	def destroy
		@lease.destroy
	end



end
