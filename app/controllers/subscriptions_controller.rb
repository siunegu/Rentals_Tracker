class SubscriptionsController < ApplicationController
	skip_before_filter :authenticate_user!
	before_filter :load_leases

	def show
	end

	# def new
	# 	@subscription = Subscription.new
	# 	# @lease = Lease.find(params[:lease_id])
	# end

	# def create
	# 	@lease = Lease.find(params[:lease_id])
	# 	@subscription = CreateSubscription.call(
	# 		@lease,
	# 		params[:email_address],
	# 		params[:stripeToken]
	# 		)
	# 	if @subscription.errors.blank?
	# 		flash[:notice] = 'Thank you for your purchase!' +
	# 		'Please click the link in the email we just sent ' +
	# 		'you to get started.'
	# 		redirect_to '/'
	# 	else
	# 		render :new
	# 	end
	# end

	# protected
	
	# def load_leases
	# 	@leases = Lease.where(published: true).order('amount')
	# end
end