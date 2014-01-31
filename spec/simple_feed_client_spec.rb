require './lib/simple_feed_client'
require 'json'

describe SimpleFeedClient do


  let!(:post) do
    text = SimpleFeedClient.new(:user => 'tony_mckernan', :password => 'password.')
    raw = text.request_to   
    raw_json = text.parse(raw)
    post  = raw_json.first
  end


  it "check type" do
    expect(post[:type]).to eq("ImageItem")
  end

  it "check image_url" do
    expect(post[:image_url]).to eq("http://cdn1.arkive.org/media/27/27E4B029-1285-4464-BE48-73CC8E46F297/Presentation.Large/Adult-honey-badger-foraging.jpg")
  end
  it "check text" do
     expect(post[:text]).to eq("honey banger")
  end 

  it "check id" do 
    # expect(post[:id]).to eq 43)
  end

  it "created_at" do
    expect(post[:created_at]).to eq("2014-01-30T16:40:19Z")
  end

  it "check link" do
    expect(post[:link]).to eq("http://localhost:3000/api/feeds/tony_mckernan/items/43.json")
  end

  it "has user" do
    user = post[:user]
    expect(user[:username]).to eq("tony_mckernan")
  end

end