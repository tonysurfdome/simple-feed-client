require 'rest_client'
require './lib/item'

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

    raw_items = JSON.parse(json, symbolize_names: true)

    items = raw_items.map do |post|
      SimpleFeedClient::Item.new(post)
    end
  end
end