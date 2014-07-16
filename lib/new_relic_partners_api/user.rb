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

	end

end
