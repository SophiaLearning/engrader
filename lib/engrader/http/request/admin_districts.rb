module Engrader::Http
  class Request::AdminDistricts < Request
    def apitask
      'admin-districts'
    end

    def params
      { ses: ses }
    end
  end
end
