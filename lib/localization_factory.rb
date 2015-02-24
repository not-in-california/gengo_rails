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
        valid_localizations << l
      else
        invalid_localizations << l
      end
    end
    return self
  end
end