module ParlayGameServices
	require 'net/http'
  class Proxy
    attr_accessor :debug, :locale

    def initialize params = {}
			raise "You mast use access token for auth, mebe you foget write check config/initializers/parlay_game_services.rb or generate it rails g parlay_game_services:install" if ParlayGameServices.key.blank? || ParlayGameServices.site_id.blank?
      @params = params
      @debug = false || params[:debug]
			@key = ParlayGameServices.key
      @site_id = ParlayGameServices.site_id
      @user_name = ParlayGameServices.user_name
      @password = ParlayGameServices.password
    end

    def invoke method, args
      args = case args
        when Hash then args.camelize_keys
        when Array then args.camelize_each
        else args
      end
      json_object = JSON.generate({:method => method, :locale => @locale, :login => @login, :application_id => @application_id, :token => @token, :param => args})
      puts "yadirect input: #{json_object}" if @debug
			uri = URI(ParlayGameServices.ep_yandex_direct_v4)

			c = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https', :verify_mode => OpenSSL::SSL::VERIFY_NONE) do |http|
		  	req = Net::HTTP::Post.new uri.request_uri
				req.content_type = 'application/json'
        req.body = json_object
			  response = http.request(req) # Net::HTTPResponse object
			end

      hash =  JSON.parse(c.body)
      puts "parlay_game_services output: #{hash}" if @debug

      if (hash.include?("error_code"))
        raise ParlayGameServices::ApiError, hash
      else
        hash["data"]
      end
    end

    def method_missing(name, args = nil, &block)
      ya_params = unless args == nil
        (args.class == Fixnum) ? args : to_hash_params(args)
      else
        nil
      end
      object = invoke(name.to_s.to_camelcase, ya_params)
    end

    def to_hash_params *args
      return {} if args.empty?
      return args.first.camelize_keys
    end
  end
end
