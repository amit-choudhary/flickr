class PersonsController < ApplicationController

  include FlickrResponse

  before_action only: :photos do
    get_response(FLICKR_PUBLIC_PHOTOS_URL, "?id=#{ params[:person_id] }")
  end
  before_action :check_parsed_entries, only: :photos

  def photos
    @user_photos = []
    @person_id = @parsed_entries.first['author']['nsid']
    @parsed_entries.each do |entry|
      @user_photos.push(entry['link'].last['href'])
    end
  end

end
