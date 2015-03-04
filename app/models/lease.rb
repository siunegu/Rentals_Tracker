# == Schema Information
#
# Table name: leases
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Lease < ActiveRecord::Base	
  has_attached_file :file, styles: {thumbnail: "100x100#"}
  validates_attachment :file,
  :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }
  
  validates :name, presence: true
  validates :amount, presence: true
  validates :interval, presence: true

	belongs_to :tenant
	belongs_to :property
	belongs_to :landlord 
	
	def formatted_amount
		@amount = Lease.amount / 100
	end
end
