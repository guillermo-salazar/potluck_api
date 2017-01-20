require 'sinatra/base'
require 'sequel'
require 'multi_json'

class PotluckAPI < Sinatra::Base
  configure :development do
    DB = Sequel.connect('sqlite://db/development.db')
  end
end
