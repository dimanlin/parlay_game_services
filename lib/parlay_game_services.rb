module ParlayGameServices
  require 'proxy'
  require 'api_error'
  require 'curb'
  require 'json'
  require 'hash'
  require 'array'
  require 'string'

	# Url for request, default for sandbox
	mattr_accessor :url
  @@url = 'https://api-sandbox.direct.yandex.ru/json-api/v4/'

	# Access token
	mattr_accessor :key
	@@key = nil

  # application id 
  mattr_accessor :site_id
  @@site_id

  # auth login
  mattr_accessor :user_name
  @@user_name

  # locale, default en
  mattr_accessor :password
  @@password

	def self.setup
		yield self
	end
end

