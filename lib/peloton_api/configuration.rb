module PelotonAPI
  Configuration = Struct.new :username, :password, keyword_init: true

  class Configuration
    DEFAULT = Configuration.new \
      username: ENV['PELOTON_USERNAME'], password: ENV['PELOTON_PASSWORD']
  end
end
