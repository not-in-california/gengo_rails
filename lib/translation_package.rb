class TranslationPackage
  attr_reader :data
  
  def initialize(localizations)
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
        callback_url: "http://requestb.in/1bcnaq81"
      }
    end
    @data = package
  end
  
  def send_to_gengo
    @response = $gengo.postTranslationJobs(self.data)
    @localizations.each_with_index do |localization, i|
      job = @response["response"]["jobs"]["job_#{i}"][0]
      localization.update_attributes(status: job["status"], job_id: job["job_id"])
    end
  end
  
  def self.create(localizations)
    new localizations
  end
end