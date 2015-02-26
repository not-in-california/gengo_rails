class LocalizationFactory
  attr_reader :valid_localizations, :invalid_localizations, :localizations
  
  def initialize
    @valid_localizations = []
    @invalid_localizations = []
    @localizations = []
  end
  
  def from_list(list)
    @localizations = list
    list.each do |localization|
      l = Localization.new(localization)
      if l.save
        @valid_localizations << l
      else
        @invalid_localizations << l
      end
    end
    return self
  end
  
  def self.export(opts = {})
    allowed_scopes = [:locale, :path, :value]
    opts = opts.delete_if { |key, value| !allowed_scopes.include?(key) }
    opts.merge!(status: "approved")
    Localization.where(opts).all
  end
end