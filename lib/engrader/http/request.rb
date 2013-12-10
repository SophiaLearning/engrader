module Engrader::Http
  class Request
    INTERFACE = %w(params apitask)

    def self.response(*args)
      new(*args).response_body
    end

    def response
      callable = -> { Base.post Engrader::Config.api_url, { apitask: apitask }.merge(params) }
      if Engrader::Config.debug_mode
        callable.call
      else
        validate_response { callable.call }
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

    def ses
      Session.ses
    end

    #no validation by default
    def validate_response
      yield
    end
  end
end

require 'engrader/http/request/login'
require 'engrader/http/request/default'
require 'engrader/http/request/app_data_post'
