module Engrader::Http
  class Request::AdminSchools
    def apitask
      'admin-schools'
    end

    def params
      { ses: Engrader::Http::Session.ses }
    end
  end
end
