require "gengo"
require "localization_factory"
require "translation_package"

module GengoRails
  class Engine < ::Rails::Engine
    config.generators do |g|
      g.test_framework      :rspec,        :fixture => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
    end

    config.to_prepare do |c|
      $gengo = Gengo::API.new({
        :public_key => ENV['GENGO_PUBLIC_KEY'],
        :private_key => ENV['GENGO_PRIVATE_KEY'],
        :sandbox => ENV['GENGO_PRODUCTION'] == "true" ? false : true,
        :api_version => '2'
      })
    end
  end
end
