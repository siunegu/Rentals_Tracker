class PropertiesController < ApplicationController
	before_action :find_property, only: [:show, :destroy]
	before_filter :authenticate_landlord!

	def index
		@properties = Property.all.where(landlord_id: current_landlord.id).order("created_at DESC")
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
    @order = Order.find(params[:id])
  end

	def property_params
		params.require(:property).permit(:address, :description, :city, :state, :price, :landlord_id)
	end	
end
