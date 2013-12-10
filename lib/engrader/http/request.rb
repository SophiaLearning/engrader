module Engrader::Http
  class Request
    INTERFACE = %w(params apitask)

    def self.response(*args)
      new(*args).response_body
    end

    def response
      if Engrader::Config.debug_mode
        request
      else
        validate_response { request }
      end
    end

    def response_body
      response.to_h
    end

    INTERFACE.each do |method_name|
      define_method method_name do
        raise NotImplementedError
      end
    end

    private

    def request
      Base.post Engrader::Config.api_url, body: {
        apitask: apitask,
        apikey: Engrader::Config.apikey
      }.merge(params)
    end

    def ses
      Session.ses
    end

    #no validation by default
    def validate_response
      yield
    end
  end
end

require 'engrader/http/request/user_login'
require 'engrader/http/request/default'
require 'engrader/http/request/app_data_post'
