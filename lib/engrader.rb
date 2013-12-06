module Engrader
  module Errors
    class UnsuccessfullRequest < Exception; end
  end
end

require 'httparty'
require "engrader/version"
require "engrader/config"
require "engrader/http"
