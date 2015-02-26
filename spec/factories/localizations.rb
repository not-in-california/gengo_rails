FactoryGirl.define do
  factory :localization do
    sequence(:path) do |n|
      "path.#{n}"
    end
    value "Any value"
    locale "en"
    data({
      job_id: "1298342",
      body_src: "other value", 
      lc_src: "en", 
      lc_tgt: "de", 
      unit_count: "2", 
      tier: "standard", 
      credits: "0.10", 
      status: "approved", 
      eta: -1, 
      ctime: 1424894043, 
      callback_url: "http:\/\/requestb.in\/1mscujf1", 
      auto_approve: "1", 
      body_tgt: "anderen Wert"
      })
  end
end
