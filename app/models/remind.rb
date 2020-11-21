class Remind < ApplicationRecord
  enum remind_by: [:sms]

  validates :name, presence: true
  validates :delay_days, numericality: true
end