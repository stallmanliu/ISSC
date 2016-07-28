# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "occi-core"
  s.version = "4.3.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Florian Feldhaus", "Piotr Kasprzak", "Boris Parak"]
  s.date = "2014-10-13"
  s.description = "OCCI is a collection of classes to simplify the implementation of the Open Cloud Computing API in Ruby"
  s.email = ["florian.feldhaus@gmail.com", "piotr.kasprzak@gwdg.de", "parak@cesnet.cz"]
  s.homepage = "https://github.com/EGI-FCTF/rOCCI-core"
  s.licenses = ["Apache License, Version 2.0"]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3")
  s.rubygems_version = "1.8.23"
  s.summary = "OCCI toolkit"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<json>, [">= 1.8.1", "~> 1.8"])
      s.add_runtime_dependency(%q<hashie>, [">= 3.3.1", "~> 3.3"])
      s.add_runtime_dependency(%q<uuidtools>, [">= 2.1.3", "~> 2.1"])
      s.add_runtime_dependency(%q<activesupport>, [">= 4.0.0", "~> 4.0"])
      s.add_runtime_dependency(%q<settingslogic>, [">= 2.0.9", "~> 2.0"])
    else
      s.add_dependency(%q<json>, [">= 1.8.1", "~> 1.8"])
      s.add_dependency(%q<hashie>, [">= 3.3.1", "~> 3.3"])
      s.add_dependency(%q<uuidtools>, [">= 2.1.3", "~> 2.1"])
      s.add_dependency(%q<activesupport>, [">= 4.0.0", "~> 4.0"])
      s.add_dependency(%q<settingslogic>, [">= 2.0.9", "~> 2.0"])
    end
  else
    s.add_dependency(%q<json>, [">= 1.8.1", "~> 1.8"])
    s.add_dependency(%q<hashie>, [">= 3.3.1", "~> 3.3"])
    s.add_dependency(%q<uuidtools>, [">= 2.1.3", "~> 2.1"])
    s.add_dependency(%q<activesupport>, [">= 4.0.0", "~> 4.0"])
    s.add_dependency(%q<settingslogic>, [">= 2.0.9", "~> 2.0"])
  end
end
