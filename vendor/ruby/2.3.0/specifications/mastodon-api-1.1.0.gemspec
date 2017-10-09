# -*- encoding: utf-8 -*-
# stub: mastodon-api 1.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "mastodon-api"
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Eugen Rochko"]
  s.date = "2017-04-04"
  s.description = "A ruby interface to the Mastodon API"
  s.email = "eugen@zeonfederated.com"
  s.homepage = "https://github.com/tootsuite/mastodon-api"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "A ruby interface to the Mastodon API"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<http>, ["~> 2.0"])
      s.add_runtime_dependency(%q<addressable>, ["~> 2.4"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
    else
      s.add_dependency(%q<http>, ["~> 2.0"])
      s.add_dependency(%q<addressable>, ["~> 2.4"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
    end
  else
    s.add_dependency(%q<http>, ["~> 2.0"])
    s.add_dependency(%q<addressable>, ["~> 2.4"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
  end
end
