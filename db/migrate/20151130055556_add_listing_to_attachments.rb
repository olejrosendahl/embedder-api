class AddListingToAttachments < ActiveRecord::Migration
  def change
    add_reference :attachments, :listing, index: true
    add_foreign_key :attachments, :listings
  end
end
