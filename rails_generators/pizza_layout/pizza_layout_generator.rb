class PizzaLayoutGenerator < Rails::Generator::Base
  def initialize(runtime_args, runtime_options = {})
    super
    @name = @args.first || 'application'
  end
  
  def manifest
    record do |m|
      m.directory 'app/views/layouts'
      m.directory 'public/stylesheets'
      m.directory 'public/images'
      m.directory 'app/helpers'
      m.directory 'app/views/shared'
      m.directory 'config/initializers'
      
      if options[:erb]
        m.template "layout.html.erb", "app/views/layouts/#{file_name}.html.erb"
        m.file     "stylesheet.css",  "public/stylesheets/#{file_name}.css"
      else
        m.directory 'public/stylesheets/sass'
        m.template "layout.html.haml",  "app/views/layouts/#{file_name}.html.haml"
        m.file     "_menu.html.haml",   "app/views/shared/_menu.html.haml"
        m.file     "application.sass",  "public/stylesheets/sass/application.sass"
        m.file     "reset.sass",        "public/stylesheets/sass/reset.sass"
        m.file     "layout.sass",       "public/stylesheets/sass/layout.sass"
        m.file     "forms.sass",        "public/stylesheets/sass/forms.sass"
        m.file     "tables.sass",       "public/stylesheets/sass/tables.sass"
        m.file "definition_lists.sass", "public/stylesheets/sass/definition_lists.sass"
      end
      m.file "will_paginate.rb",  "config/initializers/will_paginate.rb"
      m.file "required.png",      "public/images/required.png"
      m.file "helper.rb",         "app/helpers/layout_helper.rb"
    end
  end
  
  def file_name
    @name.underscore
  end

  protected

    def add_options!(opt)
      opt.separator ''
      opt.separator 'Options:'
      opt.on("--erb", "Generate ERB for view.") { |v| options[:erb] = v }
    end

    def banner
      <<-EOS
Creates generic layout, stylesheet, and helper files.

USAGE: #{$0} #{spec.name} [layout_name]
EOS
    end
end
