class Localization < ActiveRecord::Base
  attr_accessible :locale, :path, :value, :status, :job_id, :data
  
  serialize :data, JSON
  
  validates :locale, :path, :value, presence: true
  validates :path, uniqueness: { scope: :locale }
  
  def translated_value
    data["body_tgt"]
  end
end
