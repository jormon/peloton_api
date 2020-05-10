lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "peloton_api/version"

Gem::Specification.new do |spec|
  spec.name          = "peloton_api"
  spec.version       = PelotonAPI::VERSION
  spec.authors       = ["Jordan Moncharmont"]
  spec.email         = ["jormon@gmail.com"]

  spec.summary       = %q{Ruby API wrapper for onepeloton.com}
  spec.description   = %q{Ruby API wrapper for onepeloton.com}
  spec.homepage      = "https://github.com/jormon/peloton_api"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/jormon/peloton_api"
  spec.metadata["changelog_uri"] = "https://github.com/jormon/peloton_api/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
