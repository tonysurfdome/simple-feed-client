class SimpleFeedClient
  class Item

    attr_accessor  :type, :image_url, :text, :id, :created_at, :link, :feed, :user

    def initialize(arg)
      @type       = arg[:type]
      @image_url  = arg[:image_url]
      @text       = arg[:text]
      @id         = arg[:id]
      @created_at = arg[:created_at]
      @link       = arg[:link]
      @feed       = arg[:feed]
      @user       = arg[:user]
    end
  end
end