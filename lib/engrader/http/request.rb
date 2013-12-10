module Engrader::Http
  class Request
    INTERFACE = %w(params apitask)

    def self.response(*args)
      new(*args).response
    end

    def response
      validate_response do
        Base.post Engrader::Config.api_url, { apitask: apitask }.merge(params)
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
