require 'bundler'
# require 'net/http'
# require 'open-uri'
# require "rest-client"
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
require_all 'app'
ActiveRecord::Base.logger = nil
