module Engrader::Http
  class Request::Login < Request
    def apitask
      'login'
    end

    def params
      { usr: Engrader::Config.usr, pwd: Engrader::Config.pwd, apikey: Engrader::Config.apikey }
    end
  end
end
