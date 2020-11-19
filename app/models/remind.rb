class Remind < ApplicationRecord
  enum status: [:wait, :done]
  
  belongs_to :user
end