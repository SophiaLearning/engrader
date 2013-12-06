module Engrader::Http
  class Session < Base
    attr_reader :ses

    def ses
      @ses ||= get_ses
    end

    private

    def get_ses
      Session.post Engrader::Config.api_url,
        apitask: 'login',
        usr:     Engrader::Config.usr,
        pwd:     Engrader::Config.pwd,
        apikey:  Engrader::Config.apikey
    end
  end
end
