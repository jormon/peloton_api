require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "peloton_api"

RSpec::Core::RakeTask.new(:spec)

task default: :spec


desc "Verification, prints output summary of last workout to the terminal"
task :example do
  client = PelotonAPI::Client.new
  users = ['jormon', 'hft21']
  users.each do |username|
    user = client.user(user)
    workouts = client.user_workouts(user)
    puts "#{username}'s last workout: #{workouts.last}"
  end
end
