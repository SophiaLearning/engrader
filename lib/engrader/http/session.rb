module Engrader::Http
  class Session
    attr_writer :ses

    class << self
      def ses=(ses)
        Thread.current[:engrader_api_ses] = ses
      end

      def ses
        Thread.current[:engrader_api_ses] ||= new.ses
      end
    end

    #supply it with usr and pwd
    #or configure usr and pwd with Engrader::Config
    #or set ses directly with Engrader::Http::Session.ses.=
    def initialize(usr = nil, pwd = nil)
      @usr, @pwd = usr, pwd
    end

    def ses
      @ses ||= get_ses.to_h["engrade"]["values"]["ses"]
    end

    private

    def get_ses
      Engrader::Http::Request::Login.response(@usr, @pwd)
    end
  end
end
