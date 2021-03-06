##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Api < Domain
      class V2010 < Version
        class AccountContext < InstanceContext
          class ValidationRequestList < ListResource
            ##
            # Initialize the ValidationRequestList
            # @param [Version] version Version that contains the resource
            # @param [String] account_sid The account_sid
            # @return [ValidationRequestList] ValidationRequestList
            def initialize(version, account_sid: nil)
              super(version)

              # Path Solution
              @solution = {
                  account_sid: account_sid
              }
              @uri = "/Accounts/#{@solution[:account_sid]}/OutgoingCallerIds.json"
            end

            ##
            # Retrieve a single page of ValidationRequestInstance records from the API.
            # Request is executed immediately.
            # @param [String] phone_number The phone_number
            # @param [String] friendly_name The friendly_name
            # @param [String] call_delay The call_delay
            # @param [String] extension The extension
            # @param [String] status_callback The status_callback
            # @param [String] status_callback_method The status_callback_method
            # @return [ValidationRequestInstance] Newly created ValidationRequestInstance
            def create(phone_number: nil, friendly_name: :unset, call_delay: :unset, extension: :unset, status_callback: :unset, status_callback_method: :unset)
              data = Twilio::Values.of({
                  'PhoneNumber' => phone_number,
                  'FriendlyName' => friendly_name,
                  'CallDelay' => call_delay,
                  'Extension' => extension,
                  'StatusCallback' => status_callback,
                  'StatusCallbackMethod' => status_callback_method,
              })

              payload = @version.create(
                  'POST',
                  @uri,
                  data: data
              )

              ValidationRequestInstance.new(
                  @version,
                  payload,
                  account_sid: @solution[:account_sid],
              )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Api.V2010.ValidationRequestList>'
            end
          end

          class ValidationRequestPage < Page
            ##
            # Initialize the ValidationRequestPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [ValidationRequestPage] ValidationRequestPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of ValidationRequestInstance
            # @param [Hash] payload Payload response from the API
            # @return [ValidationRequestInstance] ValidationRequestInstance
            def get_instance(payload)
              ValidationRequestInstance.new(
                  @version,
                  payload,
                  account_sid: @solution[:account_sid],
              )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Api.V2010.ValidationRequestPage>'
            end
          end

          class ValidationRequestInstance < InstanceResource
            ##
            # Initialize the ValidationRequestInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] account_sid The account_sid
            # @return [ValidationRequestInstance] ValidationRequestInstance
            def initialize(version, payload, account_sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'phone_number' => payload['phone_number'],
                  'friendly_name' => payload['friendly_name'],
                  'validation_code' => payload['validation_code'].to_i,
                  'call_sid' => payload['call_sid'],
              }
            end

            ##
            # @return [String] The account_sid
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [String] The phone_number
            def phone_number
              @properties['phone_number']
            end

            ##
            # @return [String] The friendly_name
            def friendly_name
              @properties['friendly_name']
            end

            ##
            # @return [String] The validation_code
            def validation_code
              @properties['validation_code']
            end

            ##
            # @return [String] The call_sid
            def call_sid
              @properties['call_sid']
            end

            ##
            # Provide a user friendly representation
            def to_s
              "<Twilio.Api.V2010.ValidationRequestInstance>"
            end
          end
        end
      end
    end
  end
end