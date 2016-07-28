# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "logstasher"
  s.version = "0.6.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Shadab Ahmed"]
  s.date = "2015-03-15"
  s.description = "Awesome rails logs"
  s.email = ["shadab.ansari@gmail.com"]
  s.homepage = "https://github.com/shadabahmed/logstasher"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23"
  s.summary = "Awesome rails logs"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<logstash-event>, ["~> 1.2.0"])
      s.add_runtime_dependency(%q<request_store>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 2.14"])
      s.add_development_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_development_dependency(%q<rails>, [">= 3.0"])
    else
      s.add_dependency(%q<logstash-event>, ["~> 1.2.0"])
      s.add_dependency(%q<request_store>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 2.14"])
      s.add_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_dependency(%q<rails>, [">= 3.0"])
    end
  else
    s.add_dependency(%q<logstash-event>, ["~> 1.2.0"])
    s.add_dependency(%q<request_store>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 2.14"])
    s.add_dependency(%q<bundler>, [">= 1.0.0"])
    s.add_dependency(%q<rails>, [">= 3.0"])
  end
end
