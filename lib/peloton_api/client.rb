module PelotonAPI
  # The default client
  class Client
    attr_reader :configuration

    def initialize(configuration: PelotonAPI::Configuration::DEFAULT)
      @configuration = configuration
    end

    def workouts
      client.get("/workouts")
    end


  end
end
