module Occi::Api::Client
  module Http
    module AuthnPlugins

      class Digest < Base

        def initialize(env_ref, options = {})
          super env_ref, options
          @fallbacks = %w(keystone)
        end

        def setup(options = {})
          # set up digest auth
          raise ArgumentError, "Missing required options 'username' and 'password' for digest auth!" unless @options[:username] and @options[:password]
          @env_ref.class.digest_auth @options[:username], @options[:password]
        end

      end

    end
  end
end
