require 'rake'
require 'rspec/core/rake_task'
require 'yaml'

config = YAML.load_file('config.yml')
local_hosts = config[:local_hosts]
remote_hosts = config[:remote_hosts]

task :spec_local  => 'serverspec:local'
task :spec_remote  => 'serverspec:remote'
task :default => :spec_local

namespace :serverspec do
  task :local => local_hosts.map { |h| "serverspec:#{h[:name]}" }
  task :remote => remote_hosts.map { |h| "serverspec:#{h[:name]}" }

  local_hosts.concat(remote_hosts).each do |host|
    desc "Run serverspec to #{host[:name]}"
    RSpec::Core::RakeTask.new(host[:name].to_sym) do |t|
      ENV['TARGET_HOST'] = host[:name]
      t.pattern = 'spec/{' + host[:roles].join(',') + '}/*_spec.rb'
    end
  end
end
