class Listing < ActiveRecord::Base
  validates :name, :content, presence: true

  has_many :attachments
end
