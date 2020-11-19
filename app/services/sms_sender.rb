class SmsSender
  def initialize(user:)
    @user = user
  end

  def perform
    sms_send_message
  end

  private

  def sms_send_message
    number_to_send_to = @user.phone.to_i

    twilio_sid = "AC5e2fd620f1c51181e0d9c3a44ca984d5"
    twilio_token = "74e7024bafdedaad79b6c53fd310590c"
    twilio_phone_number = "9704898417"

    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
    @twilio_client.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => "+84#{number_to_send_to}",
      :body => "Wellcome #{number_to_send_to} to Localhost.com"
    )
  end
end