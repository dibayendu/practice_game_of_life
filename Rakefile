require 'rubygems'
require 'rake'

require 'rspec'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.rspec_opts = ['--format doc', '--color']
end

RSpec::Core::RakeTask.new(:simplecov) do |spec|
  require 'simplecov'
  SimpleCov.start
  spec.pattern = 'spec/**/*_spec.rb'
end

begin
  require 'cucumber/rake/task'
  Cucumber::Rake::Task.new(:features) do |f|
    f.cucumber_opts = "features --format pretty"
  end
rescue LoadError
  task :features do
    abort "Cucumber is not available. In order to run features, you must: sudo gem install cucumber"
  end
end

task default: [:spec, :features]

require 'rdoc/task'
RDoc::Task.new do |rdoc|
  if File.exist?('VERSION')
    version = File.read('VERSION')
  else
    version = ""
  end

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "game_of_life #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
