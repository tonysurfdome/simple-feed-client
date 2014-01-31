require 'rest_client'

class SimpleFeedClient
 attr_accessor  :user, :password

 def initialize(arg)
  self.user = arg[:user]
  self.password = arg[:password]
 end

 def request_to
  json = RestClient::Request.execute(:url => 'http://localhost:3000/api/feeds/tony_mckernan/items.json', 
                                     :method => 'get', 
                                     :user => user,
                                     :password => password)
 end

 def parse (json)
   raw = JSON.parse(json, symbolize_names: true)
 end

end