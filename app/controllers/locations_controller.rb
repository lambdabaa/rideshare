require "net/https"
require "uri"

class LocationsController < ApplicationController
  def autocomplete_proxy
    puts "requested:"
    puts request.domain
    uri = URI.parse(CGI.unescape(params["url"]))
    http = Net::HTTP.new(uri.host, uri.port)
    if uri.host == "maps.googleapis.com"
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    
      request = Net::HTTP::Get.new(uri.request_uri)
      body = http.request(request).body
    
      respond_to do |format|
        format.html
        format.json { render :json => body }
      end
    end
  end
end
