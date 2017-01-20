require './config/environment'
require File.dirname(__FILE__) + '/app'

# DB = Sequel.connect(ENV['DATABASE_URL'] || 'sqlite://database.db')


run PotluckAPI
