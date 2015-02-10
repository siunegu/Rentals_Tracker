class LeasesController < ApplicationController
	def new	
		
	end

	def create
		lease = Lease.build(lease_params)
		if !current_tenant.stripe_token && current_tenant.credit_card
			token = params[:stripeToken]

			stripe_tenant = Stripe::Customer.create(
											 :card => token,
											 :plan => stripe_plan_id,
											 :email => tenant.email,
											 :description => tenant.property.address
										 )
			
			stripe_plan = Stripe::Plan.create(
									    :amount => leases.property.price, # in cents
									    :currency => "usd",
									    :interval => "month",
									    :name => tenant.property.address,
									    :id => stripe_plan_id,
									    :customer => stripe_tenant.id
										)
			# Save Stripe Tenant Stripe_id to Databse for use Later
			tenant.stripe_id = stripe_tenant.id # eg. "cus_5ekJlrYS22WMUR"
			
			# Save the token as the current tenant's credit card
			current_tenant.credit_card.stripe_id = token

			# Create new subscription on an existing customer
			customer_id = Stripe::retrieve(stripe_tenant.id)
			customer_id.subscriptions.create(plan: customer_id)

		end

		lease.stripe_id = token

		if lease.save	
			redirect_to @lease
		else
		end
	end

private

	def lease_params
		params.require(:lease).permit(:address, :description, :city, :state, :price, :landlord_id)
	end	
end
