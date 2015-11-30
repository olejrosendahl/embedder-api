class Listing < ActiveRecord::Base
  validates :name, presence: true

  has_many :attachments
end
