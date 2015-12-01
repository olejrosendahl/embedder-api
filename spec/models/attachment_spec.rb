require 'rails_helper'
require 'refile/spec_helper'

describe Attachment do
  it { should belong_to(:listing) }

  it "allows attaching an image" do
    attachment = FactoryGirl.create(:attachment)

    expect(attachment.file_id).not_to be(nil)
    expect(attachment.file_filename).not_to be(nil)
    expect(attachment.file_size).not_to be(nil)
    expect(attachment.file_content_type).not_to be(nil)
  end
end
