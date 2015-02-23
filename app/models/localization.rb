class Localization < ActiveRecord::Base
  attr_accessible :locale, :path, :value
  
  validates :locale, :path, :value, presence: true
  validates :path, uniqueness: { scope: :locale }
end
