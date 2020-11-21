FactoryBot.define do
  factory :remind do
    name { 'sms_7day' }
    message_remind { 'Congratulations Sign Up successful' }
    delay_days { 7 }
    remind_by { 'sms' }
  end
end