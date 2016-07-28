# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "occi-api"
  s.version = "4.3.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Florian Feldhaus", "Piotr Kasprzak", "Boris Parak"]
  s.date = "2016-01-10"
  s.description = "This gem provides ready-to-use client classes to simplify the integration of OCCI into your application"
  s.email = ["florian.feldhaus@gmail.com", "piotr.kasprzak@gwdg.de", "parak@cesnet.cz"]
  s.homepage = "https://github.com/EGI-FCTF/rOCCI-api"
  s.licenses = ["Apache License, Version 2.0"]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3")
  s.rubygems_version = "1.8.23"
  s.summary = "OCCI development library providing a high-level client API"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<occi-core>, [">= 4.3.2", "~> 4.3"])
      s.add_runtime_dependency(%q<httparty>, [">= 0.13.1", "~> 0.13"])
      s.add_runtime_dependency(%q<json>, [">= 1.8.1", "~> 1.8"])
    else
      s.add_dependency(%q<occi-core>, [">= 4.3.2", "~> 4.3"])
      s.add_dependency(%q<httparty>, [">= 0.13.1", "~> 0.13"])
      s.add_dependency(%q<json>, [">= 1.8.1", "~> 1.8"])
    end
  else
    s.add_dependency(%q<occi-core>, [">= 4.3.2", "~> 4.3"])
    s.add_dependency(%q<httparty>, [">= 0.13.1", "~> 0.13"])
    s.add_dependency(%q<json>, [">= 1.8.1", "~> 1.8"])
  end
end
