require "peloton_api/version"
require "zeitwerk"
loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect "peloton_api" => "PelotonAPI"
loader.setup # ready!

module PelotonAPI
  class Error < StandardError; end
  # Your code goes here...
end
