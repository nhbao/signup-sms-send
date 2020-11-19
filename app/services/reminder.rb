require 'date'

class Reminder
  def initialize(user:)
    @user = user
  end

  def perform
    if save_and_sent! == true
      wait!
    else
      save_and_sent!
    end
  end

  private

  def save_and_sent!
    ActiveRecord::Base.transaction do
      remind.save!
      SmsSender.new(user: @user).perform
    end
    true
  rescue StandardError => e
    [false, e.message]  
  end

  def wait!
    Remind.last.delay(run_at: time).update(status: 'done', send_time: DateTime.now)
    SmsSender.new(user: @user).delay(run_at: time).perform
  end

  def time
    7.days.from_now
  end

  def remind
    Remind.new(
      {
        user_id: @user.id,
        send_time: @user.created_at,
        status: 'wait'
      }
    )
  end
end