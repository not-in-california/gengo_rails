require 'rails_helper'

RSpec.describe TranslationPackage, type: :class do
  before do
    $gengo = Gengo::API.new({
      :public_key => "Q3YJlTgT3^jI5P_^UJm9Au]6Ws9omzWs]ThxZ8)|bLyhxN[a8$HE5NuTk-JSqQBj",
      :private_key => "pJXjrtIh4J9tOM3-aXvulFsd4skE3ie_SHjuT(WN|{lHNX6BLkjyI(o7eURK7W[w",
      :sandbox => true,
      :api_version => '2'
    })
  end
  
  describe "#create" do
    before do
      @localization = FactoryGirl.create(:localization, locale: "de")
      @translation_package = TranslationPackage.create([@localization], update_job_localizations_url)
    end
    
    it "create a proper package" do
      expect(@translation_package.data).to eql({jobs: {
                                                    job_0: {
                                                      :type => "text",
                                                      :slug => @localization.path,
                                                      :body_src => @localization.value,
                                                      :lc_src => "en",
                                                      :lc_tgt => @localization.locale,
                                                      :tier => "standard",
                                                      :auto_approve => "1",
                                                      :custom_data => @localization.id.to_s,
                                                      :callback_url => update_job_localizations_url
                                                    }
                                                  }
                                                })
    end
  end
  
  describe "#send_to_gengo" do
    context "when request is ok" do
      before do
        @localization = FactoryGirl.create(:localization, locale: "de")
        @localization2 = FactoryGirl.create(:localization, locale: "de", value: "other value")
        @translation_package = TranslationPackage.create([@localization, @localization2], update_job_localizations_url)
      end
    
      it "delegate to gengo postTranslationJobs" do
        expect($gengo).to receive(:postTranslationJobs).with(@translation_package.data)
        VCR.use_cassette("translation_package/send_to_gengo") do
          @translation_package.send_to_gengo
        end
      end
    end
  end
end