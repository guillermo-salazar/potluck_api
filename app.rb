require 'json'
require './model/potluck'
require 'multi_json'

class PotluckAPI < Sinatra::Base
  before do
   content_type :json
   headers 'Access-Control-Allow-Origin' => '*',
            'Access-Control-Allow-Methods' => ['OPTIONS', 'GET', 'POST']
  end
  get '/' do
    'Welcome'.to_json
  end

  get '/potlucks/?' do
    # Potluck.all.map{|potluck| potluck.to_api.to_json }
    # MultiJson.dump(Potluck.all.to_json)
    [
      {
          "id": "1",
          "title": "Michael's Retirement",
          "description": "Michael is retiring.",
          "location": "West Field Park"
        },
        {
          "id": "2",
          "title": "George's Birthday",
          "description": "Someone is turning 45",
          "location": "West Field Park"
        }
      ].to_json
  end

  get '/potlucks/:id' do
    # potluck = Potluck.where(id: params[:id]).first
    # MultiJson.dump(potluck ? potluck.to_api : {})
    {
      "id": "1",
      "title": "Michael's Retirement",
      "description": "Michael is retiring.",
      "location": "West Field Park"
    }.to_json
  end



  post '/potlucks' do
    title = params[:title]
    description = params[:description]
    if Potluck.create(title: title, description: description)
      status 201
    else
      status 400
    end
  end

  options "*" do
    response.headers["Allow"] = "HEAD,GET,PUT,DELETE,OPTIONS"

    # Needed for CORS
    response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept"

    halt HTTP_STATUS_OK
  end

end
