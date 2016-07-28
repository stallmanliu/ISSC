# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "opennebula"
  s.version = "4.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["OpenNebula"]
  s.date = "2013-12-02"
  s.description = "Libraries needed to talk to OpenNebula"
  s.email = "contact@opennebula.org"
  s.homepage = "http://opennebula.org"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23"
  s.summary = "OpenNebula Client API"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>, [">= 0"])
      s.add_runtime_dependency(%q<json>, [">= 0"])
    else
      s.add_dependency(%q<nokogiri>, [">= 0"])
      s.add_dependency(%q<json>, [">= 0"])
    end
  else
    s.add_dependency(%q<nokogiri>, [">= 0"])
    s.add_dependency(%q<json>, [">= 0"])
  end
end
