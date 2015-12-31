require 'net/http'

module FlickrResponse

  private

    def get_response(url, params_string = '')
      xml_response = Net::HTTP.get_response(URI.parse(url + params_string)).body
      xml_json_response = Hash.from_xml(xml_response).to_json
      @parsed_entries = JSON.parse(xml_json_response)['feed']['entry']
    end

    def check_parsed_entries
      if @parsed_entries.nil?
        flash[:alert] = 'No photos present'
        redirect_to root_path
      elsif !@parsed_entries.is_a? Array
        @parsed_entries = [@parsed_entries]
      end
    end

end
