class AddAttachmentFileToLeases < ActiveRecord::Migration
  def self.up
    change_table :leases do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :leases, :file
  end
end
