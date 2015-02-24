class PropertiesController < ApplicationController
	before_action :find_property, only: [:show, :destroy, :edit, :update, :destroy]
	before_filter :authenticate_landlord!, only: [:new, :create, :destroy]

	def landlord_properties
		@properties = current_landlord.properties.order("created_at DESC")
	end	

	def tenant_properties

		@leases = current_tenant.leases.where(approved: true)

		# @property = @leases[0].property

	end

	# All the Properties ( it's a feature okay! ):
	def index
		@properties = Property.all
	end

	def show
		@leases = @property.leases
	end

	def new
		@property = Property.new
	end

	def create
		@property = property.new(property_params)
	end

	def edit
	end

	def update
		@property.update(property_params)
		redirect_to @property
	end

	def destroy
		@property.destroy
	end

private
	
  def find_property
    @property = Property.find(params[:id])
  end

	def property_params
		params.require(:property).permit(:address, :description, :city, :state, :price, :landlord_id)
	end	
end
