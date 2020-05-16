require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "peloton_api"

RSpec::Core::RakeTask.new(:spec)

task default: :spec


desc "Verification, prints output summary of last workout to the terminal"
task :example do
  client = PelotonAPI::Client.new
  workout = client.workouts.last
  puts "last workout: #{workout}"
end
