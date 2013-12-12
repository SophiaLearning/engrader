module Engrader
  def self.app_data_post(data, appsesid = Engrader::Config.appsesid)
    Http::Request::AppDataPost.response appsesid: appsesid, data: data
  end

  def self.app
    Http::Request::App.response
  end

  def self.admin_districts
    Http::Request::AdminDistricts.response
  end

  def self.district_schools(districtid)
    Http::Request::DistrictSchools.response districtid: districtid
  end

  def self.school_gps(schoolid)
    Http::Request::SchoolGps.response schoolid: schoolid
  end

  def self.school_teachers(schoolid)
    Http::Request::SchoolTeachers.response schoolid: schoolid
  end

  module Errors
    class UnsuccessfullRequest < Exception; end
  end
end

require 'httparty'
require "engrader/version"
require "engrader/config"
require "engrader/http"
