class TranslationPackage
  attr_reader :data
  
  def initialize(localizations, callback_url)
    package = {jobs:{}}
    @localizations = localizations
    @localizations.each_with_index do |localization, i|
      package[:jobs].merge! "job_#{i}".to_sym => {
        type: "text",
        slug: localization.path,
        body_src: localization.value,
        lc_src: "en",
        lc_tgt: localization.locale,
        tier: "standard",
        auto_approve: "1",
        custom_data: localization.id.to_s,
        callback_url: callback_url
      }
    end
    @data = package
  end
  
  def send_to_gengo
    $gengo.postTranslationJobs(self.data)
  end
  
  def self.create(localizations, callback_url)
    new localizations, callback_url
  end
end