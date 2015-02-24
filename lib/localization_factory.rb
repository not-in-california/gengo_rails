class LocalizationFactory
  def valid_localizations
    @valid_localizations ||= []
  end
  
  def invalid_localizations
    @invalid_localizations ||= []
  end
  
  def self.from_list(list)
    obj = self.new
    list.each do |localization|
      l = Localization.new(localization)
      if l.save
        obj.valid_localizations << l
      else
        obj.invalid_localizations << l
      end
    end
    return obj
  end
end