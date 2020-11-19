class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable
  after_commit :sms_send, on: :create
  
  private

  def sms_send
    Reminder.new(user: self).perform
  end
end
