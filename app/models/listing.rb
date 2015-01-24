class Listing < ActiveRecord::Base
  validates :name, presence: true
end
