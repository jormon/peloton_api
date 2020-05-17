module PelotonAPI
  # configuration loaded from environment variables by default
  class Configuration
    class << self
      def default
        @default ||= new \
          username: ENV['PELOTON_USERNAME'], password: ENV['PELOTON_PASSWORD']
      end
    end

    attr_reader :username, :password

    def initialize(username:, password:)
      @username = username
      @password = password
    end

    def ensure_valid!
      return if !username.nil? && !password.nil?

      raise Error, 'Configuration values missing for username or password'
    end
  end
end
