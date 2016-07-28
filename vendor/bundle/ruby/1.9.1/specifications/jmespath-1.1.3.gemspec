# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "jmespath"
  s.version = "1.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Trevor Rowe"]
  s.date = "2015-09-17"
  s.description = "Implements JMESPath for Ruby"
  s.email = "trevorrowe@gmail.com"
  s.homepage = "http://github.com/trevorrowe/jmespath.rb"
  s.licenses = ["Apache 2.0"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23"
  s.summary = "JMESPath - Ruby Edition"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
