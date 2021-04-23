##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'SupportingDocument' do
  it "can create" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.trusthub.v1.supporting_documents.create(friendly_name: 'friendly_name', type: 'type')
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {'FriendlyName' => 'friendly_name', 'Type' => 'type', }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://trusthub.twilio.com/v1/SupportingDocuments',
        data: values,
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "status": "DRAFT",
          "date_updated": "2021-02-11T17:23:00Z",
          "friendly_name": "Business-profile-physical-address",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "url": "https://trusthub.twilio.com/v1/SupportingDocuments/RDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2021-02-11T17:23:00Z",
          "sid": "RDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "attributes": {
              "address_sids": "ADaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
          },
          "type": "customer_profile_address",
          "mime_type": null
      }
      ]
    ))

    actual = @client.trusthub.v1.supporting_documents.create(friendly_name: 'friendly_name', type: 'type')

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.trusthub.v1.supporting_documents.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://trusthub.twilio.com/v1/SupportingDocuments',
    ))).to eq(true)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "results": [],
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://trusthub.twilio.com/v1/SupportingDocuments?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://trusthub.twilio.com/v1/SupportingDocuments?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "results"
          }
      }
      ]
    ))

    actual = @client.trusthub.v1.supporting_documents.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "results": [
              {
                  "status": "DRAFT",
                  "date_updated": "2021-02-11T17:23:00Z",
                  "friendly_name": "Business-profile-physical-address",
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "url": "https://trusthub.twilio.com/v1/SupportingDocuments/RDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "date_created": "2021-02-11T17:23:00Z",
                  "sid": "RDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "attributes": {
                      "address_sids": "ADaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                  },
                  "type": "customer_profile_address",
                  "mime_type": null
              }
          ],
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://trusthub.twilio.com/v1/SupportingDocuments?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://trusthub.twilio.com/v1/SupportingDocuments?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "results"
          }
      }
      ]
    ))

    actual = @client.trusthub.v1.supporting_documents.list()

    expect(actual).to_not eq(nil)
  end

  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.trusthub.v1.supporting_documents('RDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://trusthub.twilio.com/v1/SupportingDocuments/RDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "status": "DRAFT",
          "date_updated": "2021-02-11T17:23:00Z",
          "friendly_name": "Business-profile-physical-address",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "url": "https://trusthub.twilio.com/v1/SupportingDocuments/RDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2021-02-11T17:23:00Z",
          "sid": "RDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "attributes": {
              "address_sids": "ADaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
          },
          "type": "customer_profile_address",
          "mime_type": null
      }
      ]
    ))

    actual = @client.trusthub.v1.supporting_documents('RDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.trusthub.v1.supporting_documents('RDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://trusthub.twilio.com/v1/SupportingDocuments/RDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "status": "DRAFT",
          "date_updated": "2021-02-11T17:23:00Z",
          "friendly_name": "friendly_name",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "url": "https://trusthub.twilio.com/v1/SupportingDocuments/RDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2021-02-11T17:23:00Z",
          "sid": "RDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "attributes": {
              "address_sids": "ADaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
          },
          "type": "customer_profile_address",
          "mime_type": null
      }
      ]
    ))

    actual = @client.trusthub.v1.supporting_documents('RDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.trusthub.v1.supporting_documents('RDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://trusthub.twilio.com/v1/SupportingDocuments/RDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Twilio::Response.new(
        204,
      nil,
    ))

    actual = @client.trusthub.v1.supporting_documents('RDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()

    expect(actual).to eq(true)
  end
end