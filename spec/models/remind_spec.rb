require 'rails_helper'

RSpec.describe Remind, type: :model do
  describe 'enum' do
    it { should define_enum_for(:status).with_values([:wait, :done]) }
  end

  describe 'association' do
    it { should belong_to(:user) }
  end
end
