class HomeController < ApplicationController

  include FlickrResponse

  before_action only: :index do
    get_response(FLICKR_PUBLIC_PHOTOS_URL)
  end

  def index
    make_photos_json
  end

end
