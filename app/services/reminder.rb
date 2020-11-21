require 'date'

class Reminder
  def initialize(user:)
    @user = user
    @remind = Remind.find_by(name: 'sms_7day')
  end

  def perform
    sent!
    if @remind.remind_by == 'sms'
      wait_sms!
    end
    [true, 'success']
  rescue StandardError => e
    [false, e.message]
  end

  private

  def sent!
    SmsSender.new(user: @user, messages: 'Congratulations Sign Up successful').perform
  end

  def wait_sms!
    SmsSender.new(user: @user, messages: @remind.message_remind ).delay(run_at: time).perform
  end

  def time
    @user.created_at + @remind.delay_days.days
  end
end
