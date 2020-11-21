require 'rails_helper'

RSpec.describe Remind, type: :model do
  describe 'enum' do
    it { should define_enum_for(:remind_by).with_values([:sms]) }
  end

  describe '.validates' do
    let!(:remind) { create(:remind) }

    it { expect(remind).to validate_presence_of(:name) }
    it { expect(remind).to validate_numericality_of(:delay_days) }
  end
end
