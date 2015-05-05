require 'nokogiri'
require 'open-uri'

class AppVerifier
  attr_accessor :app

  def initialize(app)
    @app = app
  end

  def verified?
    unless @app.verified
      begin
        doc = Nokogiri::HTML(open(@app.url))
        v_code = doc.xpath('//meta[@name="metrik"]/@content').first.value

      rescue Exception => e
        verified = false
      end
    end
    app.verified
  end
end
