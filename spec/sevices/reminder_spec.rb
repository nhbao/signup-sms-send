require 'rails_helper'

RSpec.describe Reminder do
  let(:user_1) { create(:user) }
  let!(:remind) { create(:remind) }
  
  subject { Reminder.new(user: user_1) }
  
  describe '#perform' do
    context 'success' do
      specify do
        expect(subject.perform).to eq [true, 'success']
      end
    end
  end
end
  