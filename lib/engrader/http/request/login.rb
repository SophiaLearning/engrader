module Engrader::Http
  class Request::Login < Request
    class Invalid < Exception; end

    def initialize(usr = nil, pwd = nil)
      @usr, @pwd = usr, pwd
    end

    def apitask
      'login'
    end

    def params
      { usr: usr, pwd: pwd, apikey: Engrader::Config.apikey }
    end

    private

    def validate_response
      yield.tap do |resp|
        if !resp.to_h["engrade"]["values"].is_a?(Hash) || resp.to_h["engrade"]["values"]["ses"].nil?
          raise Invalid
        end
      end
    end

    def pwd
      @usr || Engrader::Config.pwd
    end

    def usr
      @pwd || Engrader::Config.usr
    end
  end
end
