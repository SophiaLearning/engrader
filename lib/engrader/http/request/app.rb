module Engrader::Http
  class Request::App < Request
    def apitask
      'app'
    end

    def params
      { ses: ses }
    end
  end
end
