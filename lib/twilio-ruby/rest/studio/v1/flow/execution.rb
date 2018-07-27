##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

module Twilio
  module REST
    class Studio < Domain
      class V1 < Version
        class FlowContext < InstanceContext
          ##
          # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
          class ExecutionList < ListResource
            ##
            # Initialize the ExecutionList
            # @param [Version] version Version that contains the resource
            # @param [String] flow_sid The unique SID identifier of the Flow.
            # @return [ExecutionList] ExecutionList
            def initialize(version, flow_sid: nil)
              super(version)

              # Path Solution
              @solution = {flow_sid: flow_sid}
              @uri = "/Flows/#{@solution[:flow_sid]}/Executions"
            end

            ##
            # Lists ExecutionInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records.  If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(limit: nil, page_size: nil)
              self.stream(limit: limit, page_size: page_size).entries
            end

            ##
            # Streams ExecutionInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit. Default is no limit.
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records. If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(page_size: limits[:page_size], )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields ExecutionInstance records from the API.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            def each
              limits = @version.read_limits

              page = self.page(page_size: limits[:page_size], )

              @version.stream(page,
                              limit: limits[:limit],
                              page_limit: limits[:page_limit]).each {|x| yield x}
            end

            ##
            # Retrieve a single page of ExecutionInstance records from the API.
            # Request is executed immediately.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of ExecutionInstance
            def page(page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })
              response = @version.page(
                  'GET',
                  @uri,
                  params
              )
              ExecutionPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of ExecutionInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of ExecutionInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              ExecutionPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of ExecutionInstance records from the API.
            # Request is executed immediately.
            # @param [String] to The Contact phone number to start a Studio Flow Execution,
            #   available as variable {{contact.channel.address}}.
            # @param [String] from The Twilio phone number to send messages or initiate calls
            #   from during the Flow Execution, available as variable {{flow.channel.address}}
            # @param [Hash] parameters JSON data that will be added to your flow's context and
            #   can accessed as variables inside your flow. For example, if you pass in
            #   Parameters={'name':'Zeke'} then inside a widget you can reference the variable
            #   {{flow.data.name}} which will return the string 'Zeke'. Note: the JSON value
            #   must explicitly be passed as a string, not as a hash object. Depending on your
            #   particular HTTP library, you may need to add quotes or URL encode your JSON
            #   string.
            # @return [ExecutionInstance] Newly created ExecutionInstance
            def create(to: nil, from: nil, parameters: :unset)
              data = Twilio::Values.of({
                  'To' => to,
                  'From' => from,
                  'Parameters' => Twilio.serialize_object(parameters),
              })

              payload = @version.create(
                  'POST',
                  @uri,
                  data: data
              )

              ExecutionInstance.new(@version, payload, flow_sid: @solution[:flow_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Studio.V1.ExecutionList>'
            end
          end

          ##
          # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
          class ExecutionPage < Page
            ##
            # Initialize the ExecutionPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [ExecutionPage] ExecutionPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of ExecutionInstance
            # @param [Hash] payload Payload response from the API
            # @return [ExecutionInstance] ExecutionInstance
            def get_instance(payload)
              ExecutionInstance.new(@version, payload, flow_sid: @solution[:flow_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Studio.V1.ExecutionPage>'
            end
          end

          ##
          # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
          class ExecutionContext < InstanceContext
            ##
            # Initialize the ExecutionContext
            # @param [Version] version Version that contains the resource
            # @param [String] flow_sid The unique SID identifier of the Flow.
            # @param [String] sid The unique SID identifier of the Execution.
            # @return [ExecutionContext] ExecutionContext
            def initialize(version, flow_sid, sid)
              super(version)

              # Path Solution
              @solution = {flow_sid: flow_sid, sid: sid, }
              @uri = "/Flows/#{@solution[:flow_sid]}/Executions/#{@solution[:sid]}"

              # Dependents
              @steps = nil
              @execution_context = nil
            end

            ##
            # Fetch a ExecutionInstance
            # @return [ExecutionInstance] Fetched ExecutionInstance
            def fetch
              params = Twilio::Values.of({})

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              ExecutionInstance.new(@version, payload, flow_sid: @solution[:flow_sid], sid: @solution[:sid], )
            end

            ##
            # Deletes the ExecutionInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              @version.delete('delete', @uri)
            end

            ##
            # Access the steps
            # @return [ExecutionStepList]
            # @return [ExecutionStepContext] if sid was passed.
            def steps(sid=:unset)
              raise ArgumentError, 'sid cannot be nil' if sid.nil?

              if sid != :unset
                return ExecutionStepContext.new(@version, @solution[:flow_sid], @solution[:sid], sid, )
              end

              unless @steps
                @steps = ExecutionStepList.new(
                    @version,
                    flow_sid: @solution[:flow_sid],
                    execution_sid: @solution[:sid],
                )
              end

              @steps
            end

            ##
            # Access the execution_context
            # @return [ExecutionContextList]
            # @return [ExecutionContextContext]
            def execution_context
              ExecutionContextContext.new(@version, @solution[:flow_sid], @solution[:sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Studio.V1.ExecutionContext #{context}>"
            end
          end

          ##
          # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
          class ExecutionInstance < InstanceResource
            ##
            # Initialize the ExecutionInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] flow_sid The unique SID identifier of the Flow.
            # @param [String] sid The unique SID identifier of the Execution.
            # @return [ExecutionInstance] ExecutionInstance
            def initialize(version, payload, flow_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'sid' => payload['sid'],
                  'account_sid' => payload['account_sid'],
                  'flow_sid' => payload['flow_sid'],
                  'contact_sid' => payload['contact_sid'],
                  'contact_channel_address' => payload['contact_channel_address'],
                  'context' => payload['context'],
                  'status' => payload['status'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                  'url' => payload['url'],
                  'links' => payload['links'],
              }

              # Context
              @instance_context = nil
              @params = {'flow_sid' => flow_sid, 'sid' => sid || @properties['sid'], }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [ExecutionContext] ExecutionContext for this ExecutionInstance
            def context
              unless @instance_context
                @instance_context = ExecutionContext.new(@version, @params['flow_sid'], @params['sid'], )
              end
              @instance_context
            end

            ##
            # @return [String] A string that uniquely identifies this Execution.
            def sid
              @properties['sid']
            end

            ##
            # @return [String] Account Sid.
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [String] Flow Sid.
            def flow_sid
              @properties['flow_sid']
            end

            ##
            # @return [String] Contact Sid.
            def contact_sid
              @properties['contact_sid']
            end

            ##
            # @return [String] The phone number, SIP address or Client identifier that triggered this Execution.
            def contact_channel_address
              @properties['contact_channel_address']
            end

            ##
            # @return [Hash] Flow state.
            def context
              @properties['context']
            end

            ##
            # @return [execution.Status] The Status of this Execution
            def status
              @properties['status']
            end

            ##
            # @return [Time] The date this Execution was created
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Time] The date this Execution was updated
            def date_updated
              @properties['date_updated']
            end

            ##
            # @return [String] The URL of this resource.
            def url
              @properties['url']
            end

            ##
            # @return [String] Nested resource URLs.
            def links
              @properties['links']
            end

            ##
            # Fetch a ExecutionInstance
            # @return [ExecutionInstance] Fetched ExecutionInstance
            def fetch
              context.fetch
            end

            ##
            # Deletes the ExecutionInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              context.delete
            end

            ##
            # Access the steps
            # @return [steps] steps
            def steps
              context.steps
            end

            ##
            # Access the execution_context
            # @return [execution_context] execution_context
            def execution_context
              context.execution_context
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Studio.V1.ExecutionInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Studio.V1.ExecutionInstance #{values}>"
            end
          end
        end
      end
    end
  end
end