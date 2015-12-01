FactoryGirl.define do
  factory :attachment do
    file { Refile::FileDouble.new("dummy", "file.txt", content_type: "text/plain") }
    listing
  end

end
