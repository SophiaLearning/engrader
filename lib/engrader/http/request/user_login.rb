module Engrader::Http
  class Request::UserLogin < Request
    class Invalid < Exception; end

    def initialize(args = {})
      @usr, @pwd = args[:usr], args[:pwd]
    end

    def apitask
      'user-login'
    end

    def params
      { usr: usr, pwd: pwd }
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
