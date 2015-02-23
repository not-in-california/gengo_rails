FactoryGirl.define do
  factory :localization do
    sequence(:path) do |n|
      "path.#{n}"
    end
    value "Any value"
    locale "en"
  end
end
