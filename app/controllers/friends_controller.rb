class FriendsController < ApplicationController

  include FlickrResponse

  before_action only: :photos do
    get_response(FLICKR_FRIENDS_PHOTOS_URL, "?user_id=#{ params[:person_id] }")
  end

  before_action :check_parsed_entries, only: :photos

  def photos
    make_photos_json
  end

end
