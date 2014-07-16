module NewRelicPartnersApi
	class Base
		include HTTParty
		base_uri 'api.newrelic.com'
		format :json

		protected

		def self.headers
			raise "api_key required" unless NewRelicPartnersApi.api_key

			return { 'x-api-key' => NewRelicPartnersApi.api_key, 'Content-Type' => 'application/json' }
		end

		def self.url(service)
			raise "partner_id required" unless NewRelicPartnersApi.partner_id

			return "/api/v2/partners/#{NewRelicPartnersApi.partner_id}/#{service}"
		end

		def self.do_get(service, path = '', options = {})
			response = self.get("#{url(SERVICES[service])}/#{path}", { :headers => headers }.merge(options) )
			raise response.message if response.code != 200

			puts response.parsed_response

			return response.parsed_response[SERVICES[service]]
		end

		def self.deserialize(service, data)
			clazz =  Object.const_get("NewRelicPartnersApi::#{service.to_s.capitalize}").new
			data.each do |k, v|
				att = k.gsub(' ', '_')
				clazz.send("#{att}=", v) if clazz.respond_to? att
			end

			return clazz
		end

		private

		SERVICES = { :account => 'accounts' }

	end
end
