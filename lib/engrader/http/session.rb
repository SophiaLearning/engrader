module Engrader::Http
  class Session
    attr_reader :ses

    def ses
      @ses ||= get_ses
    end

    private

    def get_ses
      Engrader::Http::Request::Login.response
    end
  end
end
