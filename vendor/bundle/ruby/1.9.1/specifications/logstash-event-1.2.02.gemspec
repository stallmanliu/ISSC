# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "logstash-event"
  s.version = "1.2.02"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jordan Sissel"]
  s.date = "2013-09-11"
  s.description = "Library that contains the classes required to create LogStash events"
  s.email = ["jls@semicomplete.com"]
  s.homepage = "https://github.com/logstash/logstash"
  s.licenses = ["Apache License (2.0)"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23"
  s.summary = "Library that contains the classes required to create LogStash events"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<guard>, [">= 0"])
      s.add_development_dependency(%q<guard-rspec>, [">= 0"])
      s.add_development_dependency(%q<insist>, ["= 1.0.0"])
    else
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<guard>, [">= 0"])
      s.add_dependency(%q<guard-rspec>, [">= 0"])
      s.add_dependency(%q<insist>, ["= 1.0.0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<guard>, [">= 0"])
    s.add_dependency(%q<guard-rspec>, [">= 0"])
    s.add_dependency(%q<insist>, ["= 1.0.0"])
  end
end
