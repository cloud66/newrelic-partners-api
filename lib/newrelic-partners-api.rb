require 'active_resource'

active_resource_logger = Logger.new('log/active_resource.log', 'daily')
active_resource_logger.level = Logger::DEBUG
ActiveResource::Base.logger = active_resource_logger

require 'new_relic_partners_api/new_relic_partners_api'

require 'new_relic_partners_api/base'

require 'new_relic_partners_api/account'
require 'new_relic_partners_api/product'
require 'new_relic_partners_api/user'
require 'new_relic_partners_api/subscription'
