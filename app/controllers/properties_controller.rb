class PropertiesController < ApplicationController
	before_action :find_property, only: [:show, :destroy]
	before_filter :authenticate_landlord!, only: [:new, :create, :destroy]

	def landlord_properties
		@properties = current_landlord.properties.order("created_at DESC")
	end	

	def tenant_properties
		@property = current_tenant.property
	end

	def index
		@properties = Property.all
	end

	def show
	end

	def new
		@property = Property.new
	end

	def create
		@property = property.new(property_params)
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
