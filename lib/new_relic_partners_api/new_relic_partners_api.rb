module NewRelicPartnersApi

	# api_key can be found on Partnership page under Account settings
	# partner_id is the number at the end of the URL when you're on the partnership site
	# perhaps NewRelic can improve this
	class << self
		attr_accessor :api_key, :partner_id

	end
end
