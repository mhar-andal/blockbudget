require 'sinatra'
require 'twilio-ruby'
require 'sinatra/contrib'
require_relative 'ai_logic'
include AILogic

post '/receive_sms' do
  content_type "text/xml"
  message = params['Body']
  answer = AILogic::process_question(message)
  response = Twilio::TwiML::Response.new do |r|
    r.Message answer
  end
  response.to_xml
end
