require 'nokogiri'
require 'open-uri'

class AppVerifier < ActiveRecord::Base
  attr_accessor :app

  def initialize(app)
    @app = app
  end

  def verified?
    verified = false

    if @app
      verified = @app.verified

      if !verified
        begin
          doc = Nokogiri::HTML(open(@app.url))
          v_code = doc.xpath('//meta[@name="metrik"]/@content').map(&:value)

          verified = @app.verification_code == v_code[0] if v_code.count > 0

        rescue Exception => e
          verified = false
        end
      end
    end
    verified
  end
end
