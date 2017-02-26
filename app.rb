require 'sinatra'
require 'twilio-ruby'
require 'sinatra/contrib'

post '/receive_sms' do
  content_type "text/xml"

  response = Twilio::TwiML::Response.new do |r|
    r.Message "Testing"
  end

  response.to_xml
end
