require "gengo"

module GengoRails
  class Engine < ::Rails::Engine
    config.generators do |g|
      g.test_framework      :rspec,        :fixture => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
    end

    config.to_prepare do |c|
      $gengo = Gengo::API.new({
        :public_key => ENV['GENGO_PUBLIC_KEY'] || "Q3YJlTgT3^jI5P_^UJm9Au]6Ws9omzWs]ThxZ8)|bLyhxN[a8$HE5NuTk-JSqQBj",
        :private_key => ENV['GENGO_PRIVATE_KEY'] || "pJXjrtIh4J9tOM3-aXvulFsd4skE3ie_SHjuT(WN|{lHNX6BLkjyI(o7eURK7W[w",
        :sandbox => ENV['GENGO_PRODUCTION'] == "true" ? false : true,
        :api_version => '2'
      })
    end
    
    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s
        app.config.paths["db/migrate"] += config.paths["db/migrate"].expanded
      end
    end
  end
end
