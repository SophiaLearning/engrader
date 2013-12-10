module Engrader
  def self.app_data_post(appsesid, data)
    Http::Request::AppDataPost.response appsesid: appsesid, data: data
  end

  module Errors
    class UnsuccessfullRequest < Exception; end
  end
end

require 'httparty'
require "engrader/version"
require "engrader/config"
require "engrader/http"
