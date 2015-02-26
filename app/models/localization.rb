class Localization < ActiveRecord::Base
  attr_accessible :locale, :path, :value, :status, :job_id, :data
  before_validation :set_data
  
  serialize :data, JSON
  
  validates :locale, :path, :value, presence: true
  validates :path, uniqueness: { scope: :locale }
  validates_each :data do |record, attr, value|
    record.errors.add(attr, 'must be a Hash') unless value.kind_of?(Hash)
  end
  
  scope :approved, ->{ where(status: "approved") }
  
  def translated_value
    data["body_tgt"]
  end
  
  def set_data
    self.data ||= {}
  end
end
