# == Schema Information
#
# Table name: leases
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Lease < ActiveRecord::Base
	has_attached_file :file

	belongs_to :tenant, inverse_of: :lease
	belongs_to :property
	belongs_to :landlord 
	
end
