#source 'https://rubygems.org'
#
redmine_version_file = File.expand_path("../../../lib/redmine/version.rb",__FILE__)
if (!File.exists? redmine_version_file)
  redmine_version_file = File.expand_path("lib/redmine/version.rb");
end
version_file = IO.read(redmine_version_file)
redmine_version_minor = version_file.match(/MINOR =/).post_match.match(/\d/)[0].to_i
redmine_version_major = version_file.match(/MAJOR =/).post_match.match(/\d/)[0].to_i

chiliproject_file = File.dirname(__FILE__) + "/lib/chili_project.rb"
chiliproject = File.file?(chiliproject_file)

deps = Hash.new
@dependencies.map{|dep| deps[dep.name] = dep }
rails3 = Gem::Dependency.new('rails', '~>3.0')
RAILS_VERSION_IS_3 = rails3 =~ deps['rails']
rails4 = Gem::Dependency.new('rails', '~>4.0')
RAILS_VERSION_IS_4 = rails4 =~ deps['rails']

gem "holidays", "~>1.0.3"
gem "icalendar"
# Choose nokogiri depending on RM version. This is done to avoid conflict with
# RM 2.3 which pinned nokogiri at "<1.6.0" for group :test.
# TODO: drop RM 2.3 support, its a security risk to use that nokogiri
if (redmine_version_major == 2 && redmine_version_minor == 3)
  gem "nokogiri", "< 1.6.0"
else
gem "nokogiri", "~>1.7.2"
end
gem "open-uri-cached", ">= 0.0.5"
gem "prawn"
gem 'json'

group :development do
  gem "inifile"
end

group :test do
  gem 'chronic'
  gem 'ZenTest', "=4.5.0" # 4.6.0 has a nasty bug that breaks autotest
  gem 'autotest-rails'
  #gem 'cucumber-rails', '~>1.4.0', require: false
  gem 'cucumber-rails', require: false
  gem "culerity"
  gem "cucumber"
  #gem "faye-websocket"
  gem "poltergeist"
  gem "database_cleaner"
  gem "gherkin"
  gem "rspec"
  gem "rspec-rails"
  gem "ruby-prof", :platforms => [:ruby]
  gem "spork"
  gem "test-unit", "=1.2.3"
  gem "timecop", '~> 0.3.5'
end

# moved out of the dev group so backlogs can be tested by the user after install. Too many issues of weird setups with apache, nginx, etc.
# thin doesn't work for jruby
gem "thin", :platforms => [:ruby]
