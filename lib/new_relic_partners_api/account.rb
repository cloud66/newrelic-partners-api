module NewRelicPartnersApi

	class Account < Base

		attr_accessor :id,
			:name,
			:status,
			:license_key,
			:api_key,
			:data_access_key,
			:browser_monitoring_key,
			:high_security,
			:phone_number,
			:allow_api_access,
			:testing,
			:users,
			:subscription,
			:primary_admin

		def self.list
			response = do_get('accounts', '/accounts')

			result = []
			response.each do |account|
				result << deserialize(:account, account)
			end

			return result
		end

		def destroy
			do_delete("/accounts/#{@id}")
		end

		def primary_admin=(value)
			@primary_admin = self.class.deserialize(:user, value)
		end

		def subscription=(value)
			@subscription = self.class.deserialize(:subscription, value)
		end

	end

end
