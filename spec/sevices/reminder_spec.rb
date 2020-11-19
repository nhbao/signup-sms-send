require 'rails_helper'

RSpec.describe Reminder do
  let(:user_1) { create(:user) }
  subject { Reminder.new(user: user_1) }
  
  describe '#perform' do
    context 'success' do
      specify do
        expect do
          subject.perform
        end.to change(Remind, :count).by(2)
        remind = Remind.last
        expect(remind.user_id).to eq user_1.id
        expect(remind.status).to eq 'done'
      end
    end

    context 'false' do
      before { allow_any_instance_of(Reminder).to receive(:save_and_sent!).and_return([false, 'message']) }

      specify do
        expect do
          subject.perform
        end.to change(Remind, :count).by(0)
        expect(subject.perform).to eq [false, 'message']
      end
    end
  end
end
  