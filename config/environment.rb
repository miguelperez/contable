# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  # Settings in config/environments/* take precedence over those specified here.

  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.
  # See Rails::Configuration for more options.

  # Skip frameworks you're not going to use. To use Rails without a database
  # you must remove the Active Record framework.
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]

  # Specify gems that this application depends on.
  config.gem 'RedCloth',
    :lib => 'redcloth',
    :version => '>= 4.2.2'
  config.gem 'will_paginate',
    :version => '~> 2.3.12'
  config.gem 'clearance',
    :version => '>= 0.8.4'
  config.gem 'formtastic',
    :version => '>= 0.9.7'
  config.gem 'paperclip',
    :version => '>= 2.3.1.1'
  config.gem 'rack',
    :version => '>= 1.0.1'
  config.gem 'hoptoad_notifier'

  config.gem 'annotate',
    :version => '>= 2.4.0',
    :source  => 'http://gemcutter.org'
  config.gem 'vestal_versions'

  #Creates easy menus for navigation
  config.gem "simple-navigation",
    :version => '>= 2.4.1'

  # Only load the plugins named here, in the order given. By default, all plugins 
  # in vendor/plugins are loaded in alphabetical order.
  # :all can be used as a placeholder for all plugins not explicitly named
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]
  
  # Add the vendor/gems/*/lib directories to the LOAD_PATH
  config.load_paths += Dir.glob(File.join(RAILS_ROOT, 'vendor', 'gems', '*', 'lib'))

  # Force all environments to use the same logger level
  # (by default production uses :info, the others :debug)
  # config.log_level = :debug

  # Make Time.zone default to the specified zone, and make Active Record store time values
  # in the database in UTC, and return them converted to the specified local zone.
  # Run "rake -D time" for a list of tasks for finding time zone names. Uncomment to use default local time.
  config.time_zone = 'UTC'

  # Use SQL instead of Active Record's schema dumper when creating the test database.
  # This is necessary if your schema can't be completely dumped by the schema dumper,
  # like if you have constraints or database-specific column types
  # config.active_record.schema_format = :sql

  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector

  HOST = "localhost"
  DO_NOT_REPLY = "donotreply@example.com"

  #Tell rails to look for locales in nested directories in the locales directory.
  #This is for having the locales files organized inside the confing/locales direcotry.
  config.i18n.load_path += Dir[File.join(RAILS_ROOT, 'config', 'locales', '**', '*.{rb,yml}')]

  #Tell rails to stop surrounding the form fields with fielWithErrors when validation errors
  #occur
  config.action_view.field_error_proc = proc {|html, instance| html }
end

#easy menus for navigation
require 'simple_navigation'

#Enables the pagination of results
require "will_paginate"
