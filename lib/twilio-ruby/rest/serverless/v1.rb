##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Serverless
      class V1 < Version
        ##
        # Initialize the V1 version of Serverless
        def initialize(domain)
          super
          @version = 'v1'
          @services = nil
        end

        ##
        # @param [String] sid Identifier of the Serverless Service Instance. Either a SID
        #   or UniqueName.
        # @return [Twilio::REST::Serverless::V1::ServiceContext] if sid was passed.
        # @return [Twilio::REST::Serverless::V1::ServiceList]
        def services(sid=:unset)
          if sid.nil?
            raise ArgumentError, 'sid cannot be nil'
          elsif sid == :unset
            @services ||= ServiceList.new self
          else
            ServiceContext.new(self, sid)
          end
        end

        ##
        # Provide a user friendly representation
        def to_s
          '<Twilio::REST::Serverless::V1>'
        end
      end
    end
  end
end