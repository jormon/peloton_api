module PelotonAPI
  # The default client
  class Client
    attr_reader :configuration, :cookie_jar, :authenticated

    BASE_URL = 'https://api.onepeloton.com'.freeze
    API = "#{BASE_URL}/api".freeze

    HEADERS = {
      'Content-Type' => 'application/json',
      'User-Agent' => "ruby/peloton_api/#{VERSION}",
    }.freeze

    def initialize(configuration: PelotonAPI::Configuration::DEFAULT)
      @configuration = configuration
      @cookie_jar = HTTP::CookieJar.new
      @authenticated = false
    end

    def user(username)
      Records::User.new(get("/user/#{username}"))
    end

    def workouts(user)
      options = { joins: :ride, limit: 10 }
      r = get("/user/#{user.id}/workouts", options)
      byebug
    end

    protected

    def get(path, options = nil)
      uri = URI(API + path)

      uri.query = URI.encode_www_form(options) if options

      request = Net::HTTP::Get.new uri
      request['Cookie'] = cookie uri

      response = Net::HTTP.get_response uri

      if response.is_a? Net::HTTPSuccess
        # response.get_fields('set-cookie').each do |cookie|
        #   cookie_jar.parse cookie, uri
        # end

        JSON.parse response.body, symbolize_names: true
      else
        warn 'bad user get for ' + path + ' ' + response.inspect
        byebug
      end
    end

    def cookie(uri)
      authenticate unless authenticated
      ::HTTP::Cookie.cookie_value(cookie_jar.cookies(uri))
    end

    def authenticate
      # do something to authenticate
      uri = URI(BASE_URL + '/auth/login')

      data = { username_or_email: configuration.username,
               password: configuration.password }

      response = Net::HTTP.post uri, data.to_json, HEADERS

      if response.is_a? Net::HTTPSuccess
        # store the cookies!
        response.get_fields('set-cookie').each do |cookie|
          cookie_jar.parse cookie, uri
        end

        # record success
        @authenticated = true
      else
        warn 'unable to auth: ' + response.inspect
        raise :auth_error
      end
    end
  end
end
