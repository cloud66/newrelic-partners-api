module NewRelicPartnersApi

	class User < Base
		attr_accessor :id,
			:email,
			:password,
			:first_name,
			:last_name,
			:owner,
			:role,
			:primary_admin,
			:state

		def self.list(account_id)
			response = do_get('users', "/accounts/#{account_id}/users")

			result = []
			response.each do |account|
				result << deserialize(:user, account)
			end

			return result
		end

	end

end
