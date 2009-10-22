require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    # Basic information
    gem.name = "jasperserver4r"
    gem.summary = "Client library for the JasperServer Web Services API."
    gem.description = <<-EOS
JasperServer4r provides an easy way to access the JasperServer Web Services API in Ruby.
Currently the following JasperServer Web Services are supported:
  * Report Scheduling
    EOS

    # Metadata
    gem.email = "all4miller@gmail.com"
    gem.homepage = "http://github.com/all4miller/jasperserver4r"
    gem.authors = ["all4miller"]
    gem.rubyforge_project = 'jasperserver4r'
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
  Jeweler::RubyforgeTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "jasperserver4r #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

task :test => :check_dependencies

task :default => :test
