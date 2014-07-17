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

		def self.root_url
			raise "partner_id required" unless NewRelicPartnersApi.partner_id

			return "/api/v2/partners/#{NewRelicPartnersApi.partner_id}"
		end

		def self.do_get(root, path, options = {})
			to_call = "#{root_url}#{path}"
			puts to_call if ENV['DEBUG']
			response = self.get(to_call, { :headers => headers }.merge(options) )
			raise response.message if response.code != 200

			puts response.parsed_response if ENV['DEBUG']

			if root
				return response.parsed_response[root]
			else
				return response.parsed_response
			end
		end

		def do_put(root, attributes, path, options = {})
			to_call = "#{self.class.root_url}#{path}"
			puts to_call if ENV['DEBUG']
			response = self.class.put(to_call, { :body => attributes, :headers => self.class.headers }.merge(options) )
			raise response.message if response.code != 200

			puts response.parsed_response if ENV['DEBUG']

			if root
				return response.parsed_response[root]
			else
				return response.parsed_response
			end
		end

		def do_delete(path, options = {})
			to_call = "#{self.class.root_url}#{path}"
			puts to_call if ENV['DEBUG']

			response = self.class.delete(to_call, { :headers => self.class.headers}.merge(options) )
			raise response.message if response.code != 200

			puts response.parsed_response if ENV['DEBUG']

			return response.parsed_response
		end

		def self.deserialize(service, data)
			clazz =  Object.const_get("NewRelicPartnersApi::#{service.to_s.capitalize}").new
			data.each do |k, v|
				att = k.gsub(' ', '_')
				clazz.send("#{att}=", v) if clazz.respond_to? att
			end

			return clazz
		end

		def to_hash
			hash = {}
			self.instance_variables.each {|var| hash[var.to_s.delete("@")] = self.instance_variable_get(var) }

			return hash
		end

	end
end
