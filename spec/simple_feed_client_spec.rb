require './lib/simple_feed_client'
require 'json'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr'
  c.hook_into :webmock # or :fakeweb
end



describe SimpleFeedClient do

  let!(:items) do
     VCR.use_cassette('synopsis') do
     text = SimpleFeedClient.new(:user => 'tony_mckernan', :password => 'password.')
     items = text.request_to        
     end 
  end
  
  it "check type" do
    item  = items.first
    # require 'pry'
    # binding.pry
    expect(item.type).to eq("ImageItem")
  end

  it "check image_url" do
     item  = items.first
    expect(item.image_url).to eq("http://cdn1.arkive.org/media/27/27E4B029-1285-4464-BE48-73CC8E46F297/Presentation.Large/Adult-honey-badger-foraging.jpg")
  end
  it "check text" do
     item  = items.first
     expect(item.text).to eq("honey banger")
  end 

  it "check id" do 
    # expect(post[:id]).to eq 43)
  end

  it "created_at" do
     item  = items.first
    expect(item.created_at).to eq("2014-01-30T16:40:19Z")
  end

  it "check link" do
     item  = items.first
    expect(item.link).to eq("http://localhost:3000/api/feeds/tony_mckernan/items/43.json")
  end

  it "has username" do
    item  = items.first
    user = item.user
  
    expect(user[:username]).to eq("tony_mckernan")
  end

  it "has email" do
    item  = items.first
    user = item.user
    expect(user[:email]).to eq("tony@surfdome.com")
  end

 it "has gravatar" do
    item  = items.first
    user = item.user
    expect(user[:gravatar]).to eq("http://www.gravatar.com/avatar/c4f446598bb77dbbf4982791a90b2896?s=40")
  end

  it "has feed link" do
    item  = items.first
    feed  = item.feed
    expect(feed[:link]).to eq ("http://localhost:3000/api/feeds/tony_mckernan.json")
  end

  it "has feed name" do
    item  = items.first
    feed  = item.feed
    expect(feed[:name]).to eq ("tony_mckernan")
  end

  

end