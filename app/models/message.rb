class Message < ActiveRecord::Base
	belongs_to :landlord
	belongs_to :tenant
end
