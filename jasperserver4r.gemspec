# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{jasperserver4r}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["all4miller"]
  s.date = %q{2009-10-26}
  s.description = %q{JasperServer4r provides an easy way to access the JasperServer Web Services API in Ruby.
Currently the following JasperServer Web Services are supported:
  * Report Scheduling
}
  s.email = %q{all4miller@gmail.com}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     ".loadpath",
     "CHANGELOG.rdoc",
     "MIT-LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION.yml",
     "jasperserver4r.gemspec",
     "lib/jasperserver4r.rb",
     "lib/jasperserver4r/jasperserverlogger.rb",
     "lib/jasperserver4r/reportschedulerservice.rb",
     "lib/jasperserver4r/reportschedulerservicedriver.rb",
     "lib/jasperserver4r/reportschedulerservicemappingregistry.rb",
     "test/common_utils.rb",
     "test/test_report_scheduler.rb"
  ]
  s.homepage = %q{http://github.com/all4miller/jasperserver4r}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{jasperserver4r}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Client library for the JasperServer Web Services API.}
  s.test_files = [
    "test/test_report_scheduler.rb",
     "test/common_utils.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

