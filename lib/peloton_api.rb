require 'peloton_api/version'

# if debug, require byebug
if ENV['DEBUG']
  require 'byebug'
  require 'dotenv/load'
end

# ruby std libs
require 'json'
require 'net/http'

# external gems
require 'http-cookie'
require 'zeitwerk'

# set up Zeitwerk
loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect 'peloton_api' => 'PelotonAPI'
loader.setup # ready!

module PelotonAPI
  class Error < StandardError; end
  # Your code goes here...
end
