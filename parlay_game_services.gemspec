# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{yandex_direct_api}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Hromov Dmitriy}]
  s.date = %q{2013-09-16}
  s.description = %q{A simple Parlay Game Services ruby wrapper}
  s.email = %q{devandart@ya.ru}
  s.extra_rdoc_files = [%q{CHANGELOG}, %q{LICENSE}, %q{README.md}, %q{lib/api_error.rb}, %q{lib/hash.rb}, %q{lib/proxy.rb}, %q{lib/string.rb}, %q{lib/yandex_direct_api.rb}]
  s.files = [%q{CHANGELOG}, %q{Gemfile}, %q{Gemfile.lock}, %q{LICENSE}, %q{Manifest}, %q{README.md}, %q{Rakefile}, %q{lib/api_error.rb}, %q{lib/hash.rb}, %q{lib/proxy.rb}, %q{lib/string.rb}, %q{lib/yandex_direct_api.rb}, %q{spec/hash_spec.rb}, %q{spec/proxy_spec.rb}, %q{spec/spec_helper.rb}, %q{spec/string_spec.rb}, %q{yandex_direct_api.gemspec}]
#  s.homepage = %q{}
  s.rdoc_options = [%q{--line-numbers}, %q{--inline-source}, %q{--title}, %q{parlay_game_services}, %q{--main}, %q{README.md}]
  s.require_paths = [%q{lib}]
#  s.rubyforge_project = %q{yandex_direct_api}
  s.rubygems_version = %q{0.1}
  s.summary = %q{A Parlay Game Services ruby wrapper}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<curb>, [">= 0"])
    else
      s.add_dependency(%q<curb>, [">= 0"])
    end
  else
    s.add_dependency(%q<curb>, [">= 0"])
  end
end
