class Listing < ActiveRecord::Base
  validates :name, :content, presence: true

  has_many :attachments

  def as_json(options = {})
    super(only: [:id, :name, :content, :created_at])
  end
end
