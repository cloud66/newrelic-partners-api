module NewRelicPartnersApi
	class Base < ActiveResource::Base

    class << self

      def headers
				raise "api_key required" unless NewRelicPartnersApi.api_key
				return { 'x-api-key' => NewRelicPartnersApi.api_key }
      end

			def site_url
				raise "partner_id required" unless NewRelicPartnersApi.partner_id
				"https://api.newrelic.com/api/v2/partners/#{NewRelicPartnersApi.partner_id}"
			end

    end

		self.format = ActiveResource::Formats::JsonFormat
		self.site = self.site_url

		alias_method :old_find_or_create_resource_for, :find_or_create_resource_for  unless self.respond_to?(:old_find_or_create_resource_for)

  	def find_or_create_resource_for(name)
    	name = name.to_s.gsub(" ","_").camelcase.to_sym
    	old_find_or_create_resource_for(name)
  	end

  end

end
