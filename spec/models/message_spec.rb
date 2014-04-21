require 'spec_helper'

describe Message, :vcr => true do
  it "doesn't save the message if twilio gives an error" do
    message = Message.new(body: 'hi', to: '1111111', from: '5039256254')
    message.save.should be_false
  end
  it "adds an error if the to number is invalid" do
    message = Message.new(body: 'yo', to: '1111111111', from: '5039256254')
    message.save
    message.errors.messages[:base].should eq ["The 'To' number 1111111111 is not a valid phone number."]
  end
end
