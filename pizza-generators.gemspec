# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{pizza-generators}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ryan Bates, Iain Hecker"]
  s.date = %q{2009-01-26}
  s.description = %q{A collection of useful generator scripts for Rails.}
  s.email = %q{iain@iain.nl}
  s.extra_rdoc_files = ["lib/pizza_generators.rb", "README.rdoc", "LICENSE", "tasks/deployment.rake", "CHANGELOG", "TODO"]
  s.files = ["pizza-generators.gemspec", "Rakefile", "lib/pizza_generators.rb", "rails_generators/pizza_authentication/USAGE", "rails_generators/pizza_authentication/templates/migration.rb", "rails_generators/pizza_authentication/templates/sessions_helper.rb", "rails_generators/pizza_authentication/templates/users_helper.rb", "rails_generators/pizza_authentication/templates/tests/shoulda/users_controller.rb", "rails_generators/pizza_authentication/templates/tests/shoulda/user.rb", "rails_generators/pizza_authentication/templates/tests/shoulda/sessions_controller.rb", "rails_generators/pizza_authentication/templates/tests/testunit/users_controller.rb", "rails_generators/pizza_authentication/templates/tests/testunit/user.rb", "rails_generators/pizza_authentication/templates/tests/testunit/sessions_controller.rb", "rails_generators/pizza_authentication/templates/tests/rspec/users_controller.rb", "rails_generators/pizza_authentication/templates/tests/rspec/user.rb", "rails_generators/pizza_authentication/templates/tests/rspec/sessions_controller.rb", "rails_generators/pizza_authentication/templates/users_controller.rb", "rails_generators/pizza_authentication/templates/fixtures.yml", "rails_generators/pizza_authentication/templates/user.rb", "rails_generators/pizza_authentication/templates/authentication.rb", "rails_generators/pizza_authentication/templates/session.rb", "rails_generators/pizza_authentication/templates/sessions_controller.rb", "rails_generators/pizza_authentication/templates/views/erb/signup.html.erb", "rails_generators/pizza_authentication/templates/views/erb/login.html.erb", "rails_generators/pizza_authentication/templates/views/haml/login.html.haml", "rails_generators/pizza_authentication/templates/views/haml/signup.html.haml", "rails_generators/pizza_authentication/lib/insert_commands.rb", "rails_generators/pizza_authentication/pizza_authentication_generator.rb", "rails_generators/pizza_scaffold/USAGE", "rails_generators/pizza_scaffold/templates/controller.rb", "rails_generators/pizza_scaffold/templates/migration.rb", "rails_generators/pizza_scaffold/templates/tests/shoulda/controller.rb", "rails_generators/pizza_scaffold/templates/tests/shoulda/actions/index.rb", "rails_generators/pizza_scaffold/templates/tests/shoulda/actions/show.rb", "rails_generators/pizza_scaffold/templates/tests/shoulda/actions/new.rb", "rails_generators/pizza_scaffold/templates/tests/shoulda/actions/create.rb", "rails_generators/pizza_scaffold/templates/tests/shoulda/actions/destroy.rb", "rails_generators/pizza_scaffold/templates/tests/shoulda/actions/edit.rb", "rails_generators/pizza_scaffold/templates/tests/shoulda/actions/update.rb", "rails_generators/pizza_scaffold/templates/tests/shoulda/model.rb", "rails_generators/pizza_scaffold/templates/tests/testunit/controller.rb", "rails_generators/pizza_scaffold/templates/tests/testunit/actions/index.rb", "rails_generators/pizza_scaffold/templates/tests/testunit/actions/show.rb", "rails_generators/pizza_scaffold/templates/tests/testunit/actions/new.rb", "rails_generators/pizza_scaffold/templates/tests/testunit/actions/create.rb", "rails_generators/pizza_scaffold/templates/tests/testunit/actions/destroy.rb", "rails_generators/pizza_scaffold/templates/tests/testunit/actions/edit.rb", "rails_generators/pizza_scaffold/templates/tests/testunit/actions/update.rb", "rails_generators/pizza_scaffold/templates/tests/testunit/model.rb", "rails_generators/pizza_scaffold/templates/tests/rspec/controller.rb", "rails_generators/pizza_scaffold/templates/tests/rspec/actions/index.rb", "rails_generators/pizza_scaffold/templates/tests/rspec/actions/show.rb", "rails_generators/pizza_scaffold/templates/tests/rspec/actions/new.rb", "rails_generators/pizza_scaffold/templates/tests/rspec/actions/create.rb", "rails_generators/pizza_scaffold/templates/tests/rspec/actions/destroy.rb", "rails_generators/pizza_scaffold/templates/tests/rspec/actions/edit.rb", "rails_generators/pizza_scaffold/templates/tests/rspec/actions/update.rb", "rails_generators/pizza_scaffold/templates/tests/rspec/model.rb", "rails_generators/pizza_scaffold/templates/actions/index.rb", "rails_generators/pizza_scaffold/templates/actions/show.rb", "rails_generators/pizza_scaffold/templates/actions/new.rb", "rails_generators/pizza_scaffold/templates/actions/create.rb", "rails_generators/pizza_scaffold/templates/actions/destroy.rb", "rails_generators/pizza_scaffold/templates/actions/edit.rb", "rails_generators/pizza_scaffold/templates/actions/update.rb", "rails_generators/pizza_scaffold/templates/model.rb", "rails_generators/pizza_scaffold/templates/helper.rb", "rails_generators/pizza_scaffold/templates/fixtures.yml", "rails_generators/pizza_scaffold/templates/views/erb/show.html.erb", "rails_generators/pizza_scaffold/templates/views/erb/index.html.erb", "rails_generators/pizza_scaffold/templates/views/erb/_form.html.erb", "rails_generators/pizza_scaffold/templates/views/erb/edit.html.erb", "rails_generators/pizza_scaffold/templates/views/erb/new.html.erb", "rails_generators/pizza_scaffold/templates/views/haml/edit.html.haml", "rails_generators/pizza_scaffold/templates/views/haml/index.html.haml", "rails_generators/pizza_scaffold/templates/views/haml/_form.html.haml", "rails_generators/pizza_scaffold/templates/views/haml/show.html.haml", "rails_generators/pizza_scaffold/templates/views/haml/new.html.haml", "rails_generators/pizza_scaffold/pizza_scaffold_generator.rb", "rails_generators/pizza_config/USAGE", "rails_generators/pizza_config/templates/config.yml", "rails_generators/pizza_config/templates/load_config.rb", "rails_generators/pizza_config/pizza_config_generator.rb", "rails_generators/pizza_layout/USAGE", "rails_generators/pizza_layout/templates/layout.html.haml", "rails_generators/pizza_layout/templates/stylesheet.css", "rails_generators/pizza_layout/templates/_menu.html.haml", "rails_generators/pizza_layout/templates/will_paginate.rb", "rails_generators/pizza_layout/templates/layout.html.erb", "rails_generators/pizza_layout/templates/definition_lists.sass", "rails_generators/pizza_layout/templates/required.png", "rails_generators/pizza_layout/templates/forms.sass", "rails_generators/pizza_layout/templates/layout.sass", "rails_generators/pizza_layout/templates/helper.rb", "rails_generators/pizza_layout/templates/reset.sass", "rails_generators/pizza_layout/templates/application.sass", "rails_generators/pizza_layout/templates/tables.sass", "rails_generators/pizza_layout/pizza_layout_generator.rb", "test/test_pizza_config_generator.rb", "test/test_pizza_authentication_generator.rb", "test/test_pizza_layout_generator.rb", "test/test_pizza_scaffold_generator.rb", "test/test_helper.rb", "README.rdoc", "LICENSE", "tasks/deployment.rake", "CHANGELOG", "TODO", "Manifest"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/iain/pizza-generators}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Pizza-generators", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{pizzagenerators}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{A collection of useful generator scripts for Rails.}
  s.test_files = ["test/test_pizza_config_generator.rb", "test/test_pizza_authentication_generator.rb", "test/test_pizza_layout_generator.rb", "test/test_pizza_scaffold_generator.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<authlogic>, [">= 0"])
      s.add_runtime_dependency(%q<giraffesoft-resource_controller>, [">= 0"])
      s.add_runtime_dependency(%q<mislave-will_paginate>, [">= 0"])
      s.add_runtime_dependency(%q<rspec>, [">= 0"])
      s.add_runtime_dependency(%q<rspec-rails>, [">= 0"])
      s.add_runtime_dependency(%q<mocha>, [">= 0"])
      s.add_runtime_dependency(%q<haml>, [">= 0"])
    else
      s.add_dependency(%q<authlogic>, [">= 0"])
      s.add_dependency(%q<giraffesoft-resource_controller>, [">= 0"])
      s.add_dependency(%q<mislave-will_paginate>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<rspec-rails>, [">= 0"])
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<haml>, [">= 0"])
    end
  else
    s.add_dependency(%q<authlogic>, [">= 0"])
    s.add_dependency(%q<giraffesoft-resource_controller>, [">= 0"])
    s.add_dependency(%q<mislave-will_paginate>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<rspec-rails>, [">= 0"])
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<haml>, [">= 0"])
  end
end
