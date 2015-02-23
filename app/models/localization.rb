class Localization < ActiveRecord::Base
  attr_accessible :locale, :path, :value
  
  validates :locale, :path, :value, presence: true
end
