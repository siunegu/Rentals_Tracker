class LeasesController < ApplicationController
	before_filter :authenticate_landlord!, only: [:landlord_leases]

	def new	
		@property = Property.find(params[:property_id])
		@lease = @property.leases.build
	end

	def create
		@property = Property.find(params[:property_id])
		@lease = @property.leases.build(name: params["lease"]["name"],
											 amount: params["lease"]["amount"],
											 description: params["lease"]["description"],	
											 interval: params["lease"]["interval"],
											 tenant_id: params["lease"]["tenant_id"]
											)

		if @lease.save
			redirect_to @property
		else
			render :new
		end
	end

	def edit
	end

	def update
		@lease = current_tenant.lease.build

		@lease.update
	end

	def add_credit_card
		@property = Property.find(params[:property_id])
		@lease = @property.leases.find(params[:id])

		amount = (@lease.amount).to_f
		@display_amount = amount / 100
			
	end

	def save_credit_card
		@property = Property.find(params[:property_id])
		@lease = @property.leases.find(params[:id])

		if params[:stripeToken]
			token = params[:stripeToken]

			stripe_plan = Stripe::Plan.create(
									    :amount => @lease.property.price, # in cents
									    :currency => "usd",
									    :interval => "month",
									    :name => tenant.property.address,
									    :id => "lease_#{@lease.id}"
									  )

			new_customer = Stripe::Customer.create(
				:card => token,
				:plan => "lease_#{@lease.id}",
				:email => current_tenant.email,
				:description => tenant.property.address
			)			

			current_tenant.stripe_id = new_customer.id
			current_tenant.credit_card.stripe_id = token

			current_tenant.lease.stripe_id = stripe_plan.id
			current_tenant.lease.save
			current_tenant.lease.update
	
			redirect_to tenant_my_properties_path
		else
			redirect_to add_credit_card_property_lease_path(@property, @lease)
		end

	end	

	def destroy
		@lease.destroy
	end

end
