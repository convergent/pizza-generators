require File.expand_path(File.dirname(__FILE__) + "../../lib/insert_commands.rb")
class PizzaAuthenticationGenerator < Rails::Generator::Base
  attr_accessor :user_name, :user_session_name

  def initialize(runtime_args, runtime_options = {})
    super

    @user_name = @args[0] || 'user'
    @user_session_name = @args[1] || 'session'
  end

  def manifest
    record do |m|
      m.directory "app/models"
      m.directory "app/controllers"
      m.directory "app/helpers"
      m.directory "app/views"
      m.directory "lib"

      m.directory "app/views/#{user_plural_name}"
      m.template "user.rb", "app/models/#{user_singular_name}.rb"
      m.template "users_controller.rb", "app/controllers/#{user_plural_name}_controller.rb"
      m.template "users_helper.rb", "app/helpers/#{user_plural_name}_helper.rb"
      m.template "views/#{view_language}/signup.html.#{view_language}", "app/views/#{user_plural_name}/new.html.#{view_language}"

      m.directory "app/views/#{user_session_plural_name}"
      m.template "session.rb", "app/models/#{user_session_singular_name}.rb"
      m.template "sessions_controller.rb", "app/controllers/#{user_session_plural_name}_controller.rb"

      m.template "sessions_helper.rb", "app/helpers/#{user_session_plural_name}_helper.rb"
      m.template "views/#{view_language}/login.html.#{view_language}", "app/views/#{user_session_plural_name}/new.html.#{view_language}"

      m.template "authentication.rb", "lib/authentication.rb"
      m.migration_template "migration.rb", "db/migrate", :migration_file_name => "create_#{user_plural_name}"

      m.route_resources user_plural_name
      m.route_resources user_session_plural_name
      m.route_name :login, 'login', :controller => user_session_plural_name, :action => 'new'
      m.route_name :logout, 'logout', :controller => user_session_plural_name, :action => 'destroy'
      m.route_name :signup, 'signup', :controller => user_plural_name, :action => 'new'

      app_controller = RAILS_GEM_VERSION >= "2.3" ? "application_controller.rb" : 'application.rb'
        
      m.insert_into "app/controllers/#{app_controller}", "filter_parameter_logging :password, :password_confirmation"
      m.insert_into "app/controllers/#{app_controller}", 'include Authentication'
      m.insert_into "app/controllers/#{app_controller}", 'unloadable'

      m.directory "app/factories"
      m.directory "config/initializers"
      m.file 'initializer.rb', 'config/initializers/factories.rb', :collision => :skip
      m.template "factories.rb", "app/factories/#{user_plural_name}.rb"

      if test_framework == :rspec
        m.directory "spec"
        m.directory "spec/controllers"
        m.directory "spec/models"
        m.template "tests/rspec/user.rb", "spec/models/#{user_singular_name}_spec.rb"
        m.template "tests/rspec/users_controller.rb", "spec/controllers/#{user_plural_name}_controller_spec.rb"
        m.template "tests/rspec/sessions_controller.rb", "spec/controllers/#{user_session_plural_name}_controller_spec.rb"
      else
        m.directory "test"
        m.directory "test/functional"
        m.directory "test/unit"
        m.template "tests/#{test_framework}/user.rb", "test/unit/#{user_singular_name}_test.rb"
        m.template "tests/#{test_framework}/users_controller.rb", "test/functional/#{user_plural_name}_controller_test.rb"
        m.template "tests/#{test_framework}/sessions_controller.rb", "test/functional/#{user_session_plural_name}_controller_test.rb"
      end
    end
  end

  def user_singular_name
    user_name.underscore
  end

  def user_plural_name
    user_singular_name.pluralize
  end

  def user_class_name
    user_name.camelize
  end

  def user_plural_class_name
    user_plural_name.camelize
  end

  def user_session_class_name
    user_session_name.camelize
  end

  def user_session_singular_name
    user_session_name.underscore
  end

  def user_session_plural_name
    user_session_singular_name.pluralize
  end

  def user_session_plural_class_name
    user_session_plural_name.camelize
  end

protected

  def view_language
    options[:erb] ? 'erb' : 'haml'
  end

  def test_framework
    options[:test_framework] ||= File.exist?(destination_path("spec")) ? :rspec : :testunit
  end

  def add_options!(opt)
    opt.separator ''
    opt.separator 'Options:'
    opt.on("--testunit", "Use test/unit for test files.") { options[:test_framework] = :testunit }
    opt.on("--rspec", "Use RSpec for test files.") { options[:test_framework] = :rspec }
    opt.on("--shoulda", "Use Shoulda for test files.") { options[:test_framework] = :shoulda }
    opt.on("--erb", "Generate ERB views instead of HAML.") { |v| options[:erb] = true }
  end

  def banner
    <<-EOS
Creates user model and controllers to handle registration and authentication.

USAGE: #{$0} #{spec.name} [user_name] [session_name]
EOS
  end
end
