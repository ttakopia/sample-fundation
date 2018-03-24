# -*- encoding: utf-8 -*-
# stub: will_paginate-foundation 6.2.1 ruby lib

Gem::Specification.new do |s|
  s.name = "will_paginate-foundation".freeze
  s.version = "6.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Adrian Rangel".freeze]
  s.date = "2017-06-05"
  s.description = "This gem integrates the Foundation pagination component with the will_paginate pagination gem. Supports Rails and Sinatra".freeze
  s.email = ["adrian.rangel@gmail.com".freeze]
  s.homepage = "https://github.com/acrogenesis/will_paginate-foundation".freeze
  s.licenses = ["MIT".freeze]
  s.rubyforge_project = "will_paginate-foundation".freeze
  s.rubygems_version = "2.6.13".freeze
  s.summary = "Integrates the Foundation pagination component with will_paginate".freeze

  s.installed_by_version = "2.6.13" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<will_paginate>.freeze, [">= 3.0.3"])
    else
      s.add_dependency(%q<will_paginate>.freeze, [">= 3.0.3"])
    end
  else
    s.add_dependency(%q<will_paginate>.freeze, [">= 3.0.3"])
  end
end
