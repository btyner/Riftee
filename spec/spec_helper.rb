# include app in load path
# $:<< File.join(File.dirname(__FILE__), '..', 'config')
# require 'application'
require 'active_record'
require 'yaml'

connection_info = YAML.load_file("config/database.yml")["development"]
ActiveRecord::Base.establish_connection(connection_info)

RSpec.configure do |config|
  config.around do |example|
    ActiveRecord::Base.transaction do
      example.run
      raise ActiveRecord::Rollback
    end
  end
end