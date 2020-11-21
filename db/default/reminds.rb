REMINDS = [
  { name: 'sms_7day', message_remind: 'Ahoy!?', delay_days: 7, remind_by: 'sms' }
]

REMINDS.each do |row|
  Remind.find_or_create_by(name: row[:name]) do |remind|
    remind.name       = row[:name]
    remind.message_remind = row[:message_remind]
    remind.delay_days  = row[:delay_days]
    remind.remind_by  = row[:remind_by]
  end
end
