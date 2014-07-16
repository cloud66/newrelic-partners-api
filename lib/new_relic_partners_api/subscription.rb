module NewRelicPartnersApi

	class Subscription < Base
		attr_accessor :id,
			:starts_on,
			:expires_on,
			:annual_renewal_on,
			:products


		def products=(value)
			@products ||= []
			value.each do |v|
				@products << self.class.deserialize(:product, v)
			end
		end


		def starts_on=(value)
			if value.nil?
				@starts_on = nil
				return
			end

			@starts_on = DateTime.parse(value)
		end

		def expires_on=(value)
			if value.nil?
				@expires_on = nil
				return
			end
			@expires_on = DateTime.parse(value)
		end

		def annual_renewal_on=(value)
			if value.nil?
				@annual_renewal_on = nil
				return
			end
			@annual_renewal_on = DateTime.parse(value)
		end

	end

end
