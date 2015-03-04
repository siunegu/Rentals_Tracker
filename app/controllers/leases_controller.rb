class LeasesController < ApplicationController
	# before_filter :authenticate_landlord!, only: [:add_credit_card]

	def show
		@property = Property.find(params[:property_id])
		@lease = @property.leases.find(params[:id])
		@tenant = @lease.tenant
		@credit_card = @lease.tenant.credit_card
	end

	def new	
		@property = Property.find(params[:property_id])
		@lease = @property.leases.build
	end

	def create
		@property = Property.find(params[:property_id])		
		if landlord_signed_in?
			@lease = @property.leases.build(name: params["lease"]["name"],
												 amount: params["lease"]["amount"],
												 description: params["lease"]["description"],	
												 interval: params["lease"]["interval"],
												 tenant_id: params["lease"]["tenant_id"],
												 file: params["lease"]["file_file_name"]
												)

			@lease.amount = @lease.amount.to_f / 100		

			if @lease.save
				redirect_to @property
			else
				render :new
			end
		elsif tenant_signed_in?

			@lease = current_tenant.leases.build(name: params["lease"]["name"],
												 amount: params["lease"]["amount"],
												 description: params["lease"]["description"],	
												 interval: params["lease"]["interval"],
												 tenant_id: params["lease"]["tenant_id"],
												 file: params["lease"]["file_file_name"]
												)
			@lease.amount = @lease.amount.to_f / 100		

			if @lease.save
				redirect_to @property
			else
				render :new
			end		
		end	
	end

	def tenant_applications
		@tenant = current_tenant
		@leases = @tenant.leases
	end

	def pending_applications	

		@landlord = current_landlord		
		@unapproved_leases_array = []
		current_landlord.properties.each do |property|
			@unapproved_leases_array << property.leases.where(approved: false)
		end
		@unapproved_leases_array

	end

	def edit
		@property = Property.find(params[:property_id])
		@lease = @property.leases.find(params[:id])

		@tenant = @property.lease.tenant		
	end

	def update
		@property = Property.find(params[:property_id])
		@tenant = @property.lease.tenant
		@lease = @tenant.lease.build

		@lease.update
	end

	def add_credit_card
		@property = Property.find(params[:property_id])
		@lease = @property.leases.find(params[:id])

		@amount = (@lease.amount).to_f
	end

	def save_credit_card
		@property = Property.find(params[:property_id])
		@lease = @property.leases.find(params[:id])
		@tenant = @lease.tenant

		if params[:stripeToken]
			token = params[:stripeToken]

			if Stripe::Plan
				redirect_to property_lease_path(@property, @lease), flash: {error: "This Subscription Already Exists!"}
			else
				stripe_plan = Stripe::Plan.create(
										    :amount => @lease.property.price, # in cents
										    :currency => "usd",
										    :interval => "month",
										    :name => @tenant.name,
										    :id => "lease_#{@lease.id}_#{@lease.updated_at.to_i}"
										  )

				new_customer = Stripe::Customer.create(
					:card => token,
					:plan => "lease_#{@lease.id}",
					:email => @tenant.email,
					:description => @property.address
				)			
				
				@tenant.stripe_id = new_customer.id
				@tenant.credit_card.stripe_id = token
				@tenant.lease.stripe_id = stripe_plan.id

				redirect_to save_credit_card_result_path, flash: {notice: "Your Subscription has been created!"}
			end
		end	
	end

	def save_credit_card_result
	end

	def destroy
		@lease.destroy
	end

end
