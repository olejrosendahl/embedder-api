class Attachment < ActiveRecord::Base
  attachment :file
  belongs_to :listing
end
