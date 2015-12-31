class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

    def make_photos_json
      @user_photos = {}
      @parsed_entries.each do |entry|
        @user_photos[entry['link'].last['href']] = { author_name: entry['author']['name'], author_id: entry['author']['nsid'] }
      end
    end
end
